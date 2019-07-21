test_that(
    desc = 'info',
    {
        skip_if_offline(host = 'ClinicalTrials.gov')
        info()
    }
)
