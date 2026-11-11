import { LightningElement, wire } from 'lwc';
import getDashboardData from '@salesforce/apex/EmailDashboardController.getDashboardData';

export default class EmailDashboard extends LightningElement {

    // ============================================
    // DASHBOARD DATA
    // ============================================

    data = {
        sentCount: 0,
        readCount: 0,
        repliedCount: 0,
        draftCount: 0,
        failedCount: 0,
        recentEmails: [],
        adminLogs: []
    };

    allEmails = [];

    wiredResult;

    // ============================================
    // POLLING
    // ============================================

    refreshInterval;

    // ============================================
    // FILTERS
    // ============================================

    selectedFilter = 'ALL';

    fromDate;
    toDate;

    isCustom = false;

    searchKey = '';

    filterOptions = [
        { label: 'All Time', value: 'ALL' },
        { label: 'This Week', value: 'THIS_WEEK' },
        { label: 'Last Week', value: 'LAST_WEEK' },
        { label: 'This Month', value: 'THIS_MONTH' },
        { label: 'Last Month', value: 'LAST_MONTH' },
        { label: 'Custom', value: 'CUSTOM' }
    ];

    // ============================================
    // INITIAL LOAD
    // ============================================

    // @wire(getDashboardData, {
    //     startDate: null,
    //     endDate: null
    // })
    // wiredData(result) {

    //     this.wiredResult = result;

    //     if (result.data) {

    //         this.processData(result.data);

    //     } else if (result.error) {

    //         console.error(result.error);
    //     }
    // }

    // ============================================
    // POLLING START
    // ============================================

   connectedCallback() {

    // INITIAL LOAD
    this.loadLiveData();

    // POLLING
    this.refreshInterval = setInterval(() => {

        this.loadLiveData();

    }, 100000);
}

    // ============================================
    // POLLING STOP
    // ============================================

    disconnectedCallback() {

        if (this.refreshInterval) {

            clearInterval(this.refreshInterval);
        }
    }

    // ============================================
    // LOAD LIVE DATA
    // ============================================

    loadLiveData() {

        let dates = this.calculateDates();

        getDashboardData({
            startDate: dates.startDate,
            endDate: dates.endDate
        })
            .then(data => {

                this.processData(data);

            })
            .catch(error => {

                console.error(
                    'Live refresh error:',
                    error
                );
            });
    }

    // ============================================
    // FILTER CHANGE
    // ============================================

    handleFilterChange(event) {

        this.selectedFilter =
            event.detail.value;

        this.isCustom =
            this.selectedFilter === 'CUSTOM';

        // AUTO LOAD FOR NON CUSTOM
        if (!this.isCustom) {

            this.loadLiveData();
        }
    }

    // ============================================
    // CUSTOM DATE
    // ============================================

    handleFromDate(event) {

        this.fromDate =
            event.target.value;

        if (this.fromDate && this.toDate) {

            this.loadLiveData();
        }
    }

    handleToDate(event) {

        this.toDate =
            event.target.value;

        if (this.fromDate && this.toDate) {

            this.loadLiveData();
        }
    }

    // ============================================
    // SEARCH KEY
    // ============================================

    handleSearchKeyChange(event) {

        this.searchKey =
            event.target.value;
    }

    // ============================================
    // SEARCH BUTTON
    // ============================================

    handleSearch() {

        this.filterEmails();
    }

    // ============================================
    // RESET
    // ============================================

    handleReset() {

        this.selectedFilter = 'ALL';

        this.isCustom = false;

        this.fromDate = null;

        this.toDate = null;

        this.searchKey = '';

        this.loadLiveData();
    }

    // ============================================
    // DATE CALCULATION
    // ============================================

    calculateDates() {

        if (this.selectedFilter === 'ALL') {

            return {
                startDate: null,
                endDate: null
            };
        }

        let today = new Date();

        let startDate;

        let endDate;

        switch (this.selectedFilter) {

            // ====================================
            // THIS WEEK
            // ====================================

            case 'THIS_WEEK':

                let firstDay =
                    today.getDate() -
                    today.getDay();

                startDate =
                    new Date(today);

                startDate.setDate(firstDay);

                endDate =
                    new Date();

                break;

            // ====================================
            // LAST WEEK
            // ====================================

            case 'LAST_WEEK':

                startDate =
                    new Date(today);

                startDate.setDate(
                    today.getDate() -
                    today.getDay() - 7
                );

                endDate =
                    new Date(today);

                endDate.setDate(
                    today.getDate() -
                    today.getDay() - 1
                );

                break;

            // ====================================
            // THIS MONTH
            // ====================================

            case 'THIS_MONTH':

                startDate =
                    new Date(
                        today.getFullYear(),
                        today.getMonth(),
                        1
                    );

                endDate =
                    new Date();

                break;

            // ====================================
            // LAST MONTH
            // ====================================

            case 'LAST_MONTH':

                startDate =
                    new Date(
                        today.getFullYear(),
                        today.getMonth() - 1,
                        1
                    );

                endDate =
                    new Date(
                        today.getFullYear(),
                        today.getMonth(),
                        0
                    );

                break;

            // ====================================
            // CUSTOM
            // ====================================

            case 'CUSTOM':

                return {

                    startDate:
                        this.fromDate,

                    endDate:
                        this.toDate
                };
        }

        return {

            startDate:
                startDate
                    .toISOString()
                    .split('T')[0],

            endDate:
                endDate
                    .toISOString()
                    .split('T')[0]
        };
    }

    // ============================================
    // PROCESS DATA
    // ============================================

    processData(data) {

        const total =

            (data.sentCount || 0) +

            (data.readCount || 0) +

            (data.repliedCount || 0) +

            (data.draftCount || 0) +

            (data.failedCount || 0);

        const percent = (val) =>

            total
                ? (
                    (val / total) * 100
                ).toFixed(1)
                : 0;

        // ========================================
        // STORE ALL EMAILS
        // ========================================

        this.allEmails =
            (data.recentEmails || [])
                .map(email => {

                    let statusLabel =

                        this.getStatusLabel(
                            email.Status,
                            email.IsBounced
                        );

                    return {

                        ...email,

                        statusLabel,

                        statusClass:
                            'status ' +
                            statusLabel.toLowerCase(),

                        dotClass:
                            'dot ' +
                            statusLabel.toLowerCase(),

                        time:
                            this.formatTime(
                                email.CreatedDate
                            ),

                        fromAddress:
                            email.FromAddress || 'N/A',

                        toAddress:
                            email.ToAddress || 'N/A'
                    };
                });

        // ========================================
        // UPDATE DATA
        // ========================================

        this.data = {

            ...data,

            sentPercent:
                percent(data.sentCount),

            readPercent:
                percent(data.readCount),

            repliedPercent:
                percent(data.repliedCount),

            draftPercent:
                percent(data.draftCount),

            failedPercent:
                percent(data.failedCount),

            recentEmails:
                this.allEmails
        };

        // APPLY SEARCH FILTER
       // this.filterEmails();
    }

    // ============================================
    // SEARCH FILTER
    // ============================================

    filterEmails() {

        let filteredEmails =
            [...this.allEmails];

        if (this.searchKey) {

            const keyword =
                this.searchKey.toLowerCase();

            filteredEmails =
                filteredEmails.filter(email => {

                    const subject =
                        (email.Subject || '')
                            .toLowerCase();

                    const fromAddress =
                        (email.fromAddress || '')
                            .toLowerCase();

                    const toAddress =
                        (email.toAddress || '')
                            .toLowerCase();

                    return (

                        subject.includes(keyword)

                        ||

                        fromAddress.includes(keyword)

                        ||

                        toAddress.includes(keyword)
                    );
                });
        }

        this.data = {

            ...this.data,

            recentEmails:
                filteredEmails
        };
    }

    // ============================================
    // DELIVERY BAR WIDTH
    // ============================================

    get sentStyle() {
        return `width:${this.data.sentPercent}%`;
    }

    get readStyle() {
        return `width:${this.data.readPercent}%`;
    }

    get repliedStyle() {
        return `width:${this.data.repliedPercent}%`;
    }

    get draftStyle() {
        return `width:${this.data.draftPercent}%`;
    }

    get failedStyle() {
        return `width:${this.data.failedPercent}%`;
    }

    // ============================================
    // FILTER LABEL
    // ============================================

    get selectedFilterLabel() {

        switch (this.selectedFilter) {

            case 'THIS_WEEK':
                return 'This Week';

            case 'LAST_WEEK':
                return 'Last Week';

            case 'THIS_MONTH':
                return 'This Month';

            case 'LAST_MONTH':
                return 'Last Month';

            case 'CUSTOM':
                return 'Custom Range';

            default:
                return 'All Time';
        }
    }

    // ============================================
    // STATUS LABEL
    // ============================================

    getStatusLabel(status, isBounced) {

        if (isBounced === true) {

            return 'Failed';
        }

        switch (String(status)) {

            case '3':
                return 'Sent';

            case '2':
                return 'Replied';

            case '1':
                return 'Read';

            case '0':
                return 'Draft';

            default:
                return 'Sent';
        }
    }

    // ============================================
    // FORMAT DATE/TIME
    // ============================================

    formatTime(dateStr) {

        const d = new Date(dateStr);

        const datePart =
            d.toLocaleDateString(
                'en-IN',
                {
                    month: 'short',
                    day: 'numeric',
                    year: 'numeric'
                }
            );

        const timePart =
            d.toLocaleTimeString(
                'en-IN',
                {
                    hour: '2-digit',
                    minute: '2-digit',
                    hour12: true
                }
            );

        return `${datePart} • ${timePart}`;
    }
}