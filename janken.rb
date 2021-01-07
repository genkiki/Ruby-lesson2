
#変数定義
$player_hand = 0
$enemy_hand = 0
$result_janken = ""

#関数定義
def judge_janken(player, enemy)

    if  (player == 1 && enemy == 2) ||
        (player == 2 && enemy == 3) ||
        (player == 3 && enemy == 1)
        return "win"
    elsif   (enemy == 1 && player == 2) ||
            (enemy == 2 && player == 3) ||
            (enemy == 3 && player == 1)
        return "lose"
    else
        return "draw"
    end

end

def play_janken
    loop {

        puts "じゃんけん、、、、"
        puts "1(グー) 2(チョキ) 3(パー)"
        puts "-----------"

        $player_hand = gets.chomp.to_i
        case $player_hand
            when 1
                puts "あなたの手：グー"
                break
            when 2
                puts "あなたの手：チョキ"
                break
            when 3
                puts "あなたの手：パー"
                break
        else
            puts "1,2,3のどれかを入力してください"
        end
    }

    $enemy_hand = rand(1..3)
    case $enemy_hand
        when 1
            puts "相手の手：グー"
        when 2
            puts "相手の手：チョキ"
        when 3
            puts "相手の手：パー"
    end

    puts "-----------"

    return judge_janken($player_hand, $enemy_hand)

end

def judge_acchimuite(player, enemy)

    if player == enemy
        return "match"
    else
        return "unmatch"
    end

end

def play_acchimuite

    puts "あっち向いて、、、、、"
    puts "1:上 2:右 3:下 4:左"
    puts "-----------"

    loop {
        $player_hand = gets.chomp.to_i
        case $player_hand
            when 1
                puts "あなたの手：上"
                break
            when 2
                puts "あなたの手：右"
                break
            when 3
                puts "あなたの手：下"
                break
            when 4
                puts "あなたの手：左"
                break
        else
            puts "1,2,3,4のどれかを入力してください"
        end
    }

    $enemy_hand = rand(1..4)
    case $enemy_hand
        when 1
            puts "相手の手：上"
        when 2
            puts "相手の手：右"
        when 3
            puts "相手の手：下"
        when 4
            puts "相手の手：左"
    end

    puts "-----------"

    return judge_acchimuite($player_hand, $enemy_hand)
end



#メイン処理

loop{
    loop{
        $result_janken = play_janken()

        if $result_janken != "draw"
            break
        end
    }

    result_acchimuite = play_acchimuite()
    if (result_acchimuite == "match") &&
        ($result_janken == "win")
        puts "あなたの勝ちです"
        break
    elsif   (result_acchimuite == "match") &&
            ($result_janken == "lose")
        puts "あなたの負けです"
        break
    elsif result_acchimuite == "unmatch"
        puts "引き分けです"
        puts "============"
    end
}