install.packages("ggplot2")     # グラフ作成
install.packages("dplyr")       # データ操作
install.packages("tidyr")       # データ整形
install.packages("readr")       # データ読み込み
install.packages("purrr")       # データ操作
install.packages("tibble")      # データフレーム操作

install.packages("caret")
install.packages("car")

library(ggplot2)
library(dplyr)
library(tidyr)
library(readr)
library(purrr)
library(tibble)

library(caret)       # モデルの作成と評価のためのパッケージ
library(car)         # 多重共線性の診断のためのパッケージ

# read.table()でデータを読み込みます
diabetes_data <- read.table("data/diabetes.csv", header=TRUE, sep= ",", quote="")
cardio_train_data <- read.table("data/cardio_train.csv", header=TRUE, sep=";", quote="")

model <- glm(Outcome ~ ., diabetes_data = diabetes_data, family = "binomial")
