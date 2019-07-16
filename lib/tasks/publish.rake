task publication: :environment do
    posts = Post.verified
    posts.each do |post|
        post.publish!
    end
end

task archive: :environment do
    posts = Post.published
    posts.each do |post|
        post.archive!
    end
end