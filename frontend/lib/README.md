# The Frontend

## Directory Structure
<details>
     <summary> Click to expand </summary>

```
│   main.dart
│   README.md
│
├───model
│       data_model.dart
│       data_repository.dart
│       doctor_info.dart
│       hospital_info.dart
│       mock_data.dart
│       user.dart
│
├───screens
│   │   side_nav.dart
│   │
│   ├───account
│   │       home_page.dart
│   │       login_page.dart
│   │       README.md
│   │       signup_page.dart
│   │
│   ├───amz_health_cntr
│   │   │   amz_screen.dart
│   │   │   home_screen.dart
│   │   │   side_nav.dart
│   │   │
│   │   └───pages
│   │       ├───mobile
│   │       │   │   mobile_screen.dart
│   │       │   │
│   │       │   └───widgets
│   │       │           drawer_mobile.dart
│   │       │
│   │       ├───tablet
│   │       │   │   tablet_screen.dart
│   │       │   │
│   │       │   └───widgets
│   │       │           body_content_tablet_widget.dart
│   │       │           tablet_vertical_nav_widget.dart
│   │       │
│   │       └───web
│   │           │   desktop_screen.dart
│   │           │
│   │           └───widgets
│   │                   body_content_widget.dart
│   │                   right_side_wdiget.dart
│   │                   web_vertical_nav_widget.dart
│   │
│   ├───chat
│   │       category_selector.dart
│   │       chat_screen_doctor.dart
│   │       chat_screen_user.dart
│   │       message_model_doctor.dart
│   │       message_model_user.dart
│   │       user_model.dart
│   │
│   ├───dev_ui
│   │       dev.dart
│   │
│   ├───doctor_ui
│   │       account.dart
│   │       dashboard.dart
│   │       patient_search.dart
│   │       qr_scan_page.dart
│   │       side_nav_doctor.dart
│   │
│   ├───hospital_ui
│   │   │   Dashboard.dart
│   │   │   side_nav.dart
│   │   │
│   │   └───med_shop
│   │           cart.dart
│   │           med_shop.dart
│   │
│   └───patient_ui
│       │   bottom_navbar.dart
│       │   twitter_screen.dart
│       │
│       ├───covid_ui
│       │       covid.dart
│       │       treating_covid.dart
│       │
│       ├───nearby_hosp_doc
│       │       appointment.dart
│       │       doctors.dart
│       │       hospitals.dart
│       │
│       └───profile
│               heart_stats.dart
│               med_report.dart
│               qr_create_page.dart
│
├───services
│       api_doctor.dart
│       api_hospital.dart
│
├───utils
│   │   constants.dart
│   │   pkgs.dart
│   │   user_preferences.dart
│   │
│   └───themes
│           colors.dart
│           theme.dart
│
└───widgets
        account_card.dart
        action_card.dart
        appointment_card.dart
        button_widget.dart
        button_widget_qr.dart
        card_items.dart
        card_main.dart
        card_section.dart
        card_section_hsp.dart
        category_card.dart
        chart-painter.dart
        current-data-chart-painter.dart
        custom_clipper.dart
        grid_item.dart
        moods.dart
        progress_vertical.dart
        ProjectProgressCard.dart
        ProjectStatisticsCards.dart
        README.md
        search_bar.dart
        SharedFilesItem.dart
        SubHeader.dart
        Tabs.dart
        title_widget.dart
```

</details>