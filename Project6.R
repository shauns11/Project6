#==============================================================================
#Project:    GIT commands using R
#Author:     Shaun Scholes
#Date:       August 2026
#Purpose:    Version control
#Location:   "C:/Git/Projects/Project6/Project6.R"
#==============================================================================


install.packages("gert")
library(gert)
# -----------------------------------------------------------------------
# Git configuration
# -----------------------------------------------------------------------

# Set Git username
git_config_global_set(
  name = "user.name",
  value = "Shaun Scholes"
)

# Set Git email
git_config_global_set(
  name = "user.email",
  value = "s.scholes@ucl.ac.uk"
)

setwd("C:/Git/Projects")

# Clone repository
git_clone(
  url = "https://github.com/shauns11/Project6.git",
  path = "Project6"
)

# Move into repository
setwd("C:/Git/Projects/Project6")

git_status()
git_remote_list()


# =======================================================================
# .gitignore
# =======================================================================

# Add *.dta to .gitignore
write("*.dta", file = ".gitignore", append = TRUE)


# =======================================================================
# CREATE FILES
# =======================================================================

file.create("one.txt")
file.create("two.txt")

write(
  "This is the 1st line",
  file = "one.txt",
  append = TRUE
)

write(
  "This is the 2nd line",
  file = "one.txt",
  append = TRUE
)

write(
  "This is the 1st line",
  file = "two.txt",
  append = TRUE
)

write(
  "This is the 2nd line",
  file = "two.txt",
  append = TRUE
)


# =======================================================================
# CREATE FOLDER AND FILE
# =======================================================================

dir.create("myFolder", showWarnings = FALSE)

file.create("myFolder/three.txt")

write(
  "This is the 1st line",
  file = "myFolder/three.txt",
  append = TRUE
)

write(
  "This is the 2nd line",
  file = "myFolder/three.txt",
  append = TRUE
)


# =======================================================================
# CREATE STATA DATASET
# =======================================================================

library(haven)

golfers <- data.frame(
  id = 1:10,
  golfer = c(
    "Rory",
    "Tiger",
    "Morikawa",
    "Hideki",
    "Scheffler",
    "Schauffele",
    "Min-Woo",
    "Spieth",
    "Fleetwood",
    "J.J Spaun"
  ),
  score = c(
    64, 68, 69, 70, 64,
    69, 71, 74, 70, 70
  )
)

# Save Stata dataset
write_dta(
  golfers,
  "golfers.dta"
)

# golfers.dta will be ignored by Git because
# *.dta is in .gitignore.


# =======================================================================
# COMMIT 1
# =======================================================================

# Check changes
git_status()
gert::git_add(files = ".")
git_commit(
  message = "Commit 1"
)

gert::git_branch_list(local = TRUE)
gert::git_branch_move("master", "main")
gert::git_branch_list(local = TRUE)

gert::git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)

#more changes locally.

write(
  "This is the 3rd line",
  file = "one.txt",
  append = TRUE
)

write(
  "This is the 3rd line",
  file = "two.txt",
  append = TRUE
)

write(
  "This is the 3rd line",
  file = "myFolder/three.txt",
  append = TRUE
)

write(
  "This is the 4th line",
  file = "myFolder/three.txt",
  append = TRUE
)

# =======================================================================
# COMMIT 2
# =======================================================================

gert::git_add(files = ".")

git_commit(
  message = "Commit 2"
)

gert::git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)

# =======================================================================
# ADD README
# =======================================================================

write(
  "# Project1",
  file = "README.md"
)

# Stage README
git_add("README.md")

# Commit
git_commit(
  message = "Commit 3"
)

# Push
git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)


# Check status
git_status()

# View log
git_log()


# =======================================================================
# DELETE README
# =======================================================================

file.remove("README.md")

# Stage deletion
gert::git_add(files = ".")


# Commit deletion
git_commit(
  message = "Commit 4"
)

# Push deletion to GitHub
git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)


# =======================================================================
# CREATE DEVELOPMENT BRANCH
# =======================================================================

git_branch_create("dev")
git_branch_checkout("dev")


# =======================================================================
# CREATE FILE ON DEV BRANCH
# =======================================================================

file.create("onea.txt")

write(
  "This is the 1st line",
  file = "onea.txt",
  append = TRUE
)

write(
  "This is the 2nd line",
  file = "onea.txt",
  append = TRUE
)


# Stage file
git_add("onea.txt")

# Commit
git_commit(
  message = "Commit 5: File in dev branch"
)

# =======================================================================
# MERGE DEV INTO MAIN
# =======================================================================

# Switch to main
git_branch_checkout("main")

# Merge dev
git_merge("dev")

# Push main
git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)


git_log()


# File on your Desktop
source_file <- "C:/Users/sscho/OneDrive/Desktop/Project6.R"

# Local Git repository
repo <- "C:/Git/Projects/Project6"

# Copy Project6.R into the Git repository
file.copy(
  from = source_file,
  to = repo,
  overwrite = TRUE
)

# Move into the Git repository
setwd(repo)

# Check that the file is there
file.exists(file.path(repo, "Project6.R"))

# Add the file to Git
gert::git_add(files = "Project6.R")

# Commit the file
gert::git_commit("Add Project6.R")

# Push to the main branch
gert::git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)


# =======================================================================
# DATE AND TIME
# =======================================================================

date <- Sys.Date()
time <- format(Sys.time(), "%H:%M:%S")

cat(
  "\nRun", date, "at", time, "\n"
)

cat("Project6.R finished\n")


#Final changes to R script.


# Add the file to Git
gert::git_add(files = "Project6.R")

# Commit the file
gert::git_commit("Add Project6.R")

# Push to the main branch
gert::git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)

#delete R file on desktop
file_path <- "C:/Users/sscho/OneDrive/Desktop/Project6.R"
  
if (file.exists(file_path)) {
  file.remove(file_path)
  print("File deleted.")
} else {
  print("File not found.")
}


gert::git_add(files = "Project6.R")
gert::git_commit("Add Project6.R")
gert::git_push(
  remote = "origin",
  refspec = "refs/heads/main:refs/heads/main"
)






