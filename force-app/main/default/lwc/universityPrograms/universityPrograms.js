// import { LightningElement } from 'lwc';

// export default class UniversityPrograms extends LightningElement {

//     /* =====================================================
//        SEARCH / FILTER STATE
//     ===================================================== */

//     searchTerm = '';

//     selectedLevel = 'All';


//     /* =====================================================
//        PROGRAM DATA
//     ===================================================== */

//     // programs = [

//     //     {
//     //         id: '1',
//     //         name: 'Master of Computer Applications',
//     //         level: 'Postgraduate',
//     //         category: 'Computer Applications',
//     //         icon: '💻',
//     //         duration: '2 Years',
//     //         eligibility: 'Graduation',
//     //         fee: '25,000',
//     //         mode: 'Online',
//     //         description:
//     //             'Build advanced knowledge in software development, cloud computing, databases and modern technologies.'
//     //     },

//     //     {
//     //         id: '2',
//     //         name: 'Bachelor of Computer Applications',
//     //         level: 'Undergraduate',
//     //         category: 'Computer Applications',
//     //         icon: '🖥️',
//     //         duration: '3 Years',
//     //         eligibility: '10+2',
//     //         fee: '18,000',
//     //         mode: 'Online',
//     //         description:
//     //             'Develop a strong foundation in computer science, programming and information technology.'
//     //     },

//     //     {
//     //         id: '3',
//     //         name: 'Master of Business Administration',
//     //         level: 'Postgraduate',
//     //         category: 'Management',
//     //         icon: '📈',
//     //         duration: '2 Years',
//     //         eligibility: 'Graduation',
//     //         fee: '30,000',
//     //         mode: 'Online',
//     //         description:
//     //             'Develop leadership, management and strategic business skills for modern organizations.'
//     //     },

//     //     {
//     //         id: '4',
//     //         name: 'Bachelor of Arts',
//     //         level: 'Undergraduate',
//     //         category: 'Arts & Humanities',
//     //         icon: '🎨',
//     //         duration: '3 Years',
//     //         eligibility: '10+2',
//     //         fee: '12,000',
//     //         mode: 'Distance',
//     //         description:
//     //             'Explore humanities, social sciences and interdisciplinary learning through flexible learning.'
//     //     },

//     //     {
//     //         id: '5',
//     //         name: 'Master of Commerce',
//     //         level: 'Postgraduate',
//     //         category: 'Commerce',
//     //         icon: '💼',
//     //         duration: '2 Years',
//     //         eligibility: 'Graduation',
//     //         fee: '22,000',
//     //         mode: 'Online',
//     //         description:
//     //             'Develop advanced understanding of accounting, finance, taxation and business management.'
//     //     },

//     //     {
//     //         id: '6',
//     //         name: 'Bachelor of Commerce',
//     //         level: 'Undergraduate',
//     //         category: 'Commerce',
//     //         icon: '📊',
//     //         duration: '3 Years',
//     //         eligibility: '10+2',
//     //         fee: '15,000',
//     //         mode: 'Distance',
//     //         description:
//     //             'Learn accounting, economics, finance and business fundamentals for a successful career.'
//     //     },

//     //     {
//     //         id: '7',
//     //         name: 'Diploma in Digital Marketing',
//     //         level: 'Diploma',
//     //         category: 'Professional',
//     //         icon: '📱',
//     //         duration: '1 Year',
//     //         eligibility: '10+2',
//     //         fee: '10,000',
//     //         mode: 'Online',
//     //         description:
//     //             'Learn digital marketing, social media, SEO, content strategy and online advertising.'
//     //     },

//     //     {
//     //         id: '8',
//     //         name: 'Certificate in Data Analytics',
//     //         level: 'Certificate',
//     //         category: 'Technology',
//     //         icon: '📊',
//     //         duration: '6 Months',
//     //         eligibility: '10+2',
//     //         fee: '7,500',
//     //         mode: 'Online',
//     //         description:
//     //             'Develop practical skills in data analysis, visualization and business intelligence.'
//     //     },

//     //     {
//     //         id: '9',
//     //         name: 'Master of Social Work',
//     //         level: 'Postgraduate',
//     //         category: 'Social Sciences',
//     //         icon: '🤝',
//     //         duration: '2 Years',
//     //         eligibility: 'Graduation',
//     //         fee: '20,000',
//     //         mode: 'Distance',
//     //         description:
//     //             'Develop professional knowledge and skills for social development and community services.'
//     //     },

//     //     {
//     //         id: '10',
//     //         name: 'Bachelor of Library Science',
//     //         level: 'Undergraduate',
//     //         category: 'Library Science',
//     //         icon: '📚',
//     //         duration: '3 Years',
//     //         eligibility: '10+2',
//     //         fee: '14,000',
//     //         mode: 'Distance',
//     //         description:
//     //             'Learn information management, digital libraries, cataloguing and knowledge organization.'
//     //     }

//     // ];


//     /* =====================================================
//        FILTERED PROGRAMS
//     ===================================================== */

//     get filteredPrograms() {

//         let result = [...this.programs];


//         // Level filter

//         if (this.selectedLevel !== 'All') {

//             result = result.filter(
//                 program =>
//                     program.level === this.selectedLevel
//             );

//         }


//         // Search filter

//         if (this.searchTerm) {

//             const search =
//                 this.searchTerm.toLowerCase();

//             result = result.filter(program =>

//                 program.name
//                     .toLowerCase()
//                     .includes(search)

//                 ||

//                 program.category
//                     .toLowerCase()
//                     .includes(search)

//                 ||

//                 program.level
//                     .toLowerCase()
//                     .includes(search)

//             );

//         }


//         return result;

//     }


//     get hasPrograms() {

//         return this.filteredPrograms.length > 0;

//     }


//     /* =====================================================
//        SEARCH
//     ===================================================== */

//     handleSearchInput(event) {

//         this.searchTerm =
//             event.target.value;

//     }


//     /* =====================================================
//        FILTER
//     ===================================================== */

//     handleFilter(event) {

//         this.selectedLevel =
//             event.currentTarget.dataset.level;

//     }


//     /* =====================================================
//        FILTER BUTTON CLASSES
//     ===================================================== */

//     get allFilterClass() {

//         return this.getFilterClass('All');

//     }


//     get ugFilterClass() {

//         return this.getFilterClass('Undergraduate');

//     }


//     get pgFilterClass() {

//         return this.getFilterClass('Postgraduate');

//     }


//     get diplomaFilterClass() {

//         return this.getFilterClass('Diploma');

//     }


//     get certificateFilterClass() {

//         return this.getFilterClass('Certificate');

//     }


//     getFilterClass(level) {

//         return this.selectedLevel === level
//             ? 'filter-btn selected'
//             : 'filter-btn';

//     }


//     /* =====================================================
//        CLEAR FILTER
//     ===================================================== */

//     clearFilters() {

//         this.searchTerm = '';

//         this.selectedLevel = 'All';

//     }


//     /* =====================================================
//        PROGRAM DETAILS
//     ===================================================== */

//     handleDetails(event) {

//         const programId =
//             event.currentTarget.dataset.id;

//         const selectedProgram =
//             this.programs.find(
//                 program =>
//                     program.id === programId
//             );

//         console.log(
//             'Selected Program:',
//             selectedProgram
//         );

//         /*
//          * Next step:
//          *
//          * Show a Program Details section
//          * inside this component.
//          */

//     }


//     /* =====================================================
//        APPLY
//     ===================================================== */

//     handleApply(event) {

//         const programId =
//             event.currentTarget.dataset.id;

//         const selectedProgram =
//             this.programs.find(
//                 program =>
//                     program.id === programId
//             );

//         console.log(
//             'Apply for program:',
//             selectedProgram
//         );

//         /*
//          * Next step:
//          *
//          * Open Admission Form
//          * and pass selectedProgram.id
//          */

//     }


//     /* =====================================================
//        GENERAL APPLICATION
//     ===================================================== */

//     handleApplyGeneral() {

//         console.log(
//             'Start general application'
//         );

//     }

// }
import { LightningElement } from 'lwc';

import getPrograms
    from '@salesforce/apex/UniversityProgramController.getPrograms';

export default class UniversityPrograms extends LightningElement {

    /* =====================================================
       STATE
    ===================================================== */

    searchTerm = '';

    selectedLevel = 'All';

    programs = [];

    isLoading = false;

    errorMessage = '';


    /* =====================================================
       LOAD PROGRAMS
    ===================================================== */

    connectedCallback() {

        this.loadPrograms();

    }


    loadPrograms() {

        this.isLoading = true;

        this.errorMessage = '';

        getPrograms()

            .then(result => {

                this.programs = result;

            })

            .catch(error => {

                console.error(
                    'Error loading programs:',
                    error
                );

                this.errorMessage =
                    'Unable to load programs. Please try again.';

            })

            .finally(() => {

                this.isLoading = false;

            });

    }


    /* =====================================================
       FILTERED PROGRAMS
    ===================================================== */

    get filteredPrograms() {

        let result = [...this.programs];


        /* LEVEL FILTER */

        if (this.selectedLevel !== 'All') {

            result = result.filter(
                program =>
                    program.Level__c === this.selectedLevel
            );

        }


        /* SEARCH FILTER */

        if (this.searchTerm) {

            const search =
                this.searchTerm.toLowerCase();

            result = result.filter(program =>

                (program.Name || '')
                    .toLowerCase()
                    .includes(search)

                ||

                (program.Category__c || '')
                    .toLowerCase()
                    .includes(search)

                ||

                (program.Level__c || '')
                    .toLowerCase()
                    .includes(search)

                ||

                (program.Program_Code__c || '')
                    .toLowerCase()
                    .includes(search)

            );

        }


        return result;

    }


    /* =====================================================
       HAS PROGRAMS
    ===================================================== */

    get hasPrograms() {

        return this.filteredPrograms.length > 0;

    }


    /* =====================================================
       SEARCH
    ===================================================== */

    handleSearchInput(event) {

        this.searchTerm =
            event.target.value;

    }


    /* =====================================================
       FILTER
    ===================================================== */

    handleFilter(event) {

        this.selectedLevel =
            event.currentTarget.dataset.level;

    }


    /* =====================================================
       FILTER BUTTON CLASSES
    ===================================================== */

    get allFilterClass() {

        return this.getFilterClass('All');

    }


    get ugFilterClass() {

        return this.getFilterClass('Undergraduate');

    }


    get pgFilterClass() {

        return this.getFilterClass('Postgraduate');

    }


    get diplomaFilterClass() {

        return this.getFilterClass('Diploma');

    }


    get certificateFilterClass() {

        return this.getFilterClass('Certificate');

    }


    getFilterClass(level) {

        return this.selectedLevel === level
            ? 'filter-btn selected'
            : 'filter-btn';

    }


    /* =====================================================
       CLEAR FILTER
    ===================================================== */

    clearFilters() {

        this.searchTerm = '';

        this.selectedLevel = 'All';

    }


    /* =====================================================
       PROGRAM DETAILS
    ===================================================== */

    handleDetails(event) {

        const programId =
            event.currentTarget.dataset.id;

        const selectedProgram =
            this.programs.find(
                program =>
                    program.Id === programId
            );

        console.log(
            'Selected Program:',
            selectedProgram
        );

        /*
         * Next step:
         * Open Program Details screen
         */

    }


    /* =====================================================
       APPLY
    ===================================================== */

    // handleApply(event) {

    //     const programId =
    //         event.currentTarget.dataset.id;

    //     const selectedProgram =
    //         this.programs.find(
    //             program =>
    //                 program.Id === programId
    //         );

    //     console.log(
    //         'Apply for:',
    //         selectedProgram
    //     );
    // }
        /*
         * Next step:
         * Open Admission Form
         * with selected Program Id
         */

    
    handleApply(event) {

    const programId =
        event.currentTarget.dataset.id;

    this.dispatchEvent(
        new CustomEvent('apply', {
            detail: {
                programId
            }
        })
    );
}


    /* =====================================================
       GENERAL APPLICATION
    ===================================================== */

    handleApplyGeneral() {

        console.log(
            'Start general application'
        );

    }

}