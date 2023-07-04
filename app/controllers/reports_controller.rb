class ReportsController < ApplicationController
  before_action :set_dates, only: %i[ report_by_category report_by_dates ]

  def index
    @title = 'All reports'
  end

  def report_by_category
    @title = 'Report by category'

    @category_data = Operation
                    .order(odate: :asc)
                    .where(odate: (@date_1)..(@date_2 + 12.hours))
                    .map { |op| [op.category.name, op.amount] }
    @data_grouped_hash = {}
    @category_data.each do |datum|
      key = datum[0]
      @data_grouped_hash[key] = 0 unless @data_grouped_hash.key?(key)
      @data_grouped_hash[key] += datum[1]
    end
    @labels = []
    @data = []
    @data_grouped_hash.each do |key, value|
      @labels.push key
      @data.push value
    end

  end

  def report_by_dates
    @title = 'Report by dates'

    @dates_data = Operation
                    .order(odate: :asc)
                    .where(odate: (@date_1)..(@date_2 + 12.hours))
                    .map { |op| [op.odate.strftime('%Y-%m-%d'), op.amount] }
    @data_grouped_hash = {}
    @dates_data.each do |datum|
      key = datum[0]
      @data_grouped_hash[key] = 0 unless @data_grouped_hash.key?(key)
      @data_grouped_hash[key] += datum[1]
    end
    @labels = []
    @data = []
    @data_grouped_hash.each do |key, value|
      @labels.push key
      @data.push value
    end

  end

  private

  def set_dates
    begin
      @date_1 = Time.parse(params['date_1'])
    rescue
      @date_1 = Time.new(Time.now.year, Time.now.month, 1)
    end

    begin
      @date_2 = Time.parse(params['date_2'])
    rescue
      @date_2 = Time.new(Time.now.year, Time.now.month, Time.now.day)
    end

    (@date_1, @date_2 = @date_2, @date_1) if @date_1 > @date_2
    (@date_1 = Time.now) if @date_1 > Time.now
    (@date_2 = Time.now) if @date_2 > Time.now
  end

end
