//
//  HourlyForecastCollectionViewCell.swift
//  tempoAPP
//
//  Created by Wesley Prado on 04/12/2024.
//

import UIKit

class HourlyForecastCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HourlyForecast"
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "13:00"
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.text = "25°C"
        label.textColor = UIColor.contrastColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        //imageView.image = UIImage(named: "sunIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [hourLabel, iconImageView,temperatureLabel])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.layer.borderWidth = 1
        stackView.layer.borderColor = UIColor.contrastColor?.cgColor
        stackView.layer.cornerRadius = 20
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        return stackView
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadData(time: String?, icon: UIImage?, temp: String?){
        hourLabel.text = time
        iconImageView.image = icon
        temperatureLabel.text = temp
    }
    
    private func setupView(){
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(stackView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
}
