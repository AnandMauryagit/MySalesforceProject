import { LightningElement } from 'lwc';

export default class UniversityHome extends LightningElement {

    /* =====================================================
       PAGE STATE
    ===================================================== */

    currentPage = 'home';
    selectedProgramId;


    /* =====================================================
       SERVICES
    ===================================================== */

    services = [
        {
            title: 'Admissions',
            icon: '🎓',
            description: 'Apply for admission and track your application.'
        },
        {
            title: 'Programs',
            icon: '📚',
            description: 'Explore undergraduate, postgraduate and diploma programs.'
        },
        {
            title: 'Examination',
            icon: '📝',
            description: 'Manage examination registration and schedules.'
        },
        {
            title: 'Results',
            icon: '📊',
            description: 'Check your examination results and academic performance.'
        },
        {
            title: 'Fees',
            icon: '💳',
            description: 'View fees, payments and outstanding balances.'
        },
        {
            title: 'Documents',
            icon: '📄',
            description: 'Download certificates, marksheets and other documents.'
        }
    ];


    /* =====================================================
       ANNOUNCEMENTS
    ===================================================== */

    announcements = [
        {
            day: '20',
            month: 'AUG',
            category: 'ADMISSION',
            title: 'Admission Application Open',
            description:
                'Applications are now open for the upcoming academic session.'
        },
        {
            day: '18',
            month: 'AUG',
            category: 'EXAMINATION',
            title: 'Examination Registration Notice',
            description:
                'Students can now register for the upcoming semester examinations.'
        },
        {
            day: '15',
            month: 'AUG',
            category: 'ACADEMIC',
            title: 'Academic Calendar Released',
            description:
                'The academic calendar for the upcoming session is now available.'
        }
    ];


    /* =====================================================
       HOME PAGE PROGRAMS
    ===================================================== */

    programs = [
        {
            name: 'Master of Computer Applications',
            type: 'POSTGRADUATE',
            icon: '💻',
            description:
                'Build advanced skills in software development, technology and computer applications.'
        },
        {
            name: 'Bachelor of Computer Applications',
            type: 'UNDERGRADUATE',
            icon: '🖥️',
            description:
                'Develop a strong foundation in computer science and information technology.'
        },
        {
            name: 'Master of Business Administration',
            type: 'POSTGRADUATE',
            icon: '📈',
            description:
                'Develop leadership, management and business strategy capabilities.'
        },
        {
            name: 'Bachelor of Arts',
            type: 'UNDERGRADUATE',
            icon: '🎨',
            description:
                'Explore humanities, social sciences and interdisciplinary learning.'
        }
    ];


    /* =====================================================
       PAGE GETTERS
    ===================================================== */

    get isHome() {
        return this.currentPage === 'home';
    }

    get isPrograms() {
        return this.currentPage === 'programs';
    }

    get isAdmissions() {
        return this.currentPage === 'admissions';
    }

    get isStudentServices() {
        return this.currentPage === 'studentServices';
    }

    get isExamination() {
        return this.currentPage === 'examination';
    }

    get isResults() {
        return this.currentPage === 'results';
    }

    get isAnnouncements() {
        return this.currentPage === 'announcements';
    }

    get isContact() {
        return this.currentPage === 'contact';
    }


    /* =====================================================
       NAVIGATION ACTIVE CLASSES
    ===================================================== */

    get homeNavClass() {
        return this.currentPage === 'home'
            ? 'active'
            : '';
    }

    get aboutNavClass() {
        return this.currentPage === 'about'
            ? 'active'
            : '';
    }

    get programsNavClass() {
        return this.currentPage === 'programs'
            ? 'active'
            : '';
    }

    get admissionsNavClass() {
        return this.currentPage === 'admissions'
            ? 'active'
            : '';
    }

    get studentServicesNavClass() {
        return this.currentPage === 'studentServices'
            ? 'active'
            : '';
    }

    get examinationNavClass() {
        return this.currentPage === 'examination'
            ? 'active'
            : '';
    }

    get resultsNavClass() {
        return this.currentPage === 'results'
            ? 'active'
            : '';
    }

    get announcementsNavClass() {
        return this.currentPage === 'announcements'
            ? 'active'
            : '';
    }

    get contactNavClass() {
        return this.currentPage === 'contact'
            ? 'active'
            : '';
    }


    /* =====================================================
       MAIN NAVIGATION
    ===================================================== */

    handleNavigation(event) {

        const page = event.currentTarget.dataset.page;

        this.currentPage = page;

    }


    handleHome() {

        this.currentPage = 'home';

    }


    /* =====================================================
       PROGRAMS
    ===================================================== */

    handleProgramsClick() {

        this.currentPage = 'programs';

    }


    handlePrograms() {

        this.currentPage = 'programs';

    }


    /* =====================================================
       HOME PROGRAM DETAILS
    ===================================================== */

    handleProgramDetails(event) {

        const program =
            event.currentTarget.dataset.program;

        console.log(
            'Selected Program:',
            program
        );

    }


    /* =====================================================
       ADMISSION
    ===================================================== */

    handleAdmission() {

        this.currentPage = 'admissions';

    }


    /* =====================================================
       SERVICES
    ===================================================== */

    handleService(event) {

        const service =
            event.currentTarget.dataset.service;

        console.log(
            'Service selected:',
            service
        );

        /*
         * Later we can connect each service
         * to its own component/page.
         */

        if (service === 'Programs') {

            this.currentPage = 'programs';

        } else if (service === 'Admissions') {

            this.currentPage = 'admissions';

        } else if (service === 'Examination') {

            this.currentPage = 'examination';

        } else if (service === 'Results') {

            this.currentPage = 'results';

        }

    }


    /* =====================================================
       ANNOUNCEMENTS
    ===================================================== */

    handleAnnouncements() {

        this.currentPage = 'announcements';

    }


    handleNotice(event) {

        console.log(
            'Notice selected:',
            event.currentTarget
        );

    }


    /* =====================================================
       LOGIN
    ===================================================== */

    handleLogin() {

        console.log('Student Login');

        /*
         * Later:
         * Navigate to Student Portal/Login
         */

    }


    /* =====================================================
       SEARCH
    ===================================================== */

    handleSearch() {

        console.log('Global Search');

    }
    handleProgramApply(event) {

        this.selectedProgramId =
            event.detail.programId;

        this.currentPage = 'admissions';
    }
}