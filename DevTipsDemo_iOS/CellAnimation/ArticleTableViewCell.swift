//
//  ArticleTableViewCell.swift
//  DevTipsDemo_iOS
//
//  Created by Carl on 2022/11/8.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.contentMode = .scaleAspectFill
        postImageView.clipsToBounds = true
        return postImageView
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont(name: "Avenir", size: 20)
        return titleLabel
    }()
    lazy var subTitleLabel: UILabel = {
        let subTitleLabel = UILabel()
        subTitleLabel.font = UIFont(name: "Avenir", size: 15)
        subTitleLabel.text = "BY APPCODA"
        return subTitleLabel
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(postImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subTitleLabel)
        postImageView.snp.makeConstraints { make in
            make.top.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.height.equalTo(156)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(postImageView.snp_bottom).offset(10)
            make.left.right.equalTo(postImageView)
        }
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp_bottom).offset(10)
            make.left.right.equalTo(postImageView)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
