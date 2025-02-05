create or replace view `inbound-mote-444923-d2.tennis_rankings.active_atp_players` as
select distinct winner as player_name from (
  -- selecting all winners from 2025 and 2024
    select *
    from `inbound-mote-444923-d2.tennis_rankings.2024_atp_raw_matches`

    union all
    
    select *
    from `inbound-mote-444923-d2.tennis_rankings.2025_atp_raw_matches`
  )

union distinct 

select distinct loser as player_name from (
  -- selecting all winners from 2025 and 2024
    select *
    from `inbound-mote-444923-d2.tennis_rankings.2024_atp_raw_matches`

    union all
    
    select *
    from `inbound-mote-444923-d2.tennis_rankings.2025_atp_raw_matches`
  )
where parse_date('%m/%d/%y', match_date) >= date_sub(current_date(), interval 52 week);
