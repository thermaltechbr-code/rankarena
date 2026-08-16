import { createClient } from '@supabase/supabase-js'

process.loadEnvFile('.env.local')

const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL || ''
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY || ''
const supabase = createClient(supabaseUrl, supabaseKey)

async function test() {
  console.log('Testing members query...')
  const { data, error } = await supabase
    .from('community_members')
    .select('id')
    .limit(1)

  if (error) {
    console.error('Error:', error)
  } else {
    console.log('Data:', data)
  }
}

test()
