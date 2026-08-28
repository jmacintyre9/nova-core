NovaJobs = NovaJobs or {}

NovaJobs.Definitions = {
    unemployed = {
        label = 'Unemployed',
        grades = {
            [0] = {name = 'civilian', label = 'Civilian', salary = 0}
        }
    },

    police = {
        label = 'Police',
        grades = {
            [0] = {name = 'recruit', label = 'Recruit', salary = 500},
            [1] = {name = 'officer', label = 'Officer', salary = 750},
            [2] = {name = 'sergeant', label = 'Sergeant', salary = 1000},
            [3] = {name = 'lieutenant', label = 'Lieutenant', salary = 1250},
            [4] = {name = 'chief', label = 'Chief', salary = 1500}
        }
    },

    ambulance = {
        label = 'EMS',
        grades = {
            [0] = {name = 'trainee', label = 'Trainee', salary = 500},
            [1] = {name = 'paramedic', label = 'Paramedic', salary = 750},
            [2] = {name = 'doctor', label = 'Doctor', salary = 1000},
            [3] = {name = 'chief', label = 'Chief', salary = 1250}
        }
    },

    mechanic = {
        label = 'Mechanic',
        grades = {
            [0] = {name = 'apprentice', label = 'Apprentice', salary = 500},
            [1] = {name = 'mechanic', label = 'Mechanic', salary = 750},
            [2] = {name = 'senior', label = 'Senior Mechanic', salary = 1000},
            [3] = {name = 'manager', label = 'Shop Manager', salary = 1250}
        }
    }
}

function NovaJobs.Get(jobName)
    return NovaJobs.Definitions[jobName]
end

function NovaJobs.GetGrade(jobName, grade)
    local job = NovaJobs.Get(jobName)
    if not job then return nil end
    return job.grades[tonumber(grade) or 0]
end

function NovaJobs.BuildJob(jobName, grade, onduty)
    local job = NovaJobs.Get(jobName)
    local gradeData = NovaJobs.GetGrade(jobName, grade)

    if not job or not gradeData then return nil end

    return {
        name = jobName,
        label = job.label,
        grade = tonumber(grade) or 0,
        gradeName = gradeData.name,
        gradeLabel = gradeData.label,
        salary = gradeData.salary,
        onduty = onduty == true
    }
end
