
# read.table()でデータを読み込みます
diabetes_data <- read.table("data/diabetes.csv", header=TRUE, sep= ",", quote="")
cardio_train_data <- read.table("data/cardio_train.csv", header=TRUE, sep=";", quote="")

# print(head(diabetes_data))
# print(head(cardio_train_data))

# print(tail(diabetes_data))
# print(tail(cardio_train_data))

# print(diabetes_data)
# print(cardio_train_data)


print(summary(diabetes_data))

plot(BloodPressure ~ Age, data = diabetes_data) 