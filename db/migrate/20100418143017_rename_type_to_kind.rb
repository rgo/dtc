class RenameTypeToKind < ActiveRecord::Migration
  def self.up
    rename_column :ovens, :type, :kind
    rename_column :worktop_gas, :type, :kind
    rename_column :worktop_inductions, :type, :kind
  end

  def self.down
    rename_column :ovens, :kind, :type
    rename_column :worktop_gas, :kind, :type
    rename_column :worktop_inductions, :kind, :type
  end
end
