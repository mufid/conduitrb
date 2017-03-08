# Poor man's testing. Rspec later.

# Serialization

require 'json'
require 'conduitrb'
require 'pry'

def assertion(statement=nil)
  result =
    if block_given?
      yield
    else
      statement
    end

  raise StandardError, 'Assertion failed!' unless result
end

json = '
  {
    "userName": "something",
    "nestedObject": {
      "correct": true
    },
    "array": [
      3, 4, 5
    ],
    "objectArray": [
      {
        "cool": true
      },
      {
        "cool": false
      }
    ]
  }
'

hash = JSON.parse(json)
rs = ConduitRb::ResponseObject.new(hash)

assertion { rs.user_name == 'something' }
assertion { rs.nestedObject.correct == true }
assertion { rs.array[0] == 3 }
assertion { rs.array[1] == 4 }
assertion { rs.array[2] == 5 }
assertion { rs.object_array.first.cool == true }
assertion { rs.object_array.last.cool == false }

puts "OK!"
