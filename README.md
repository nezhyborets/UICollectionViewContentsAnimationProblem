# UICollectionViewContentsAnimationProblem
UICollectionViewCell - contents do not animate along with cell's contentView

Problem looks like this: http://i.imgur.com/5iaAiGQ.mp4
(red is a color of cell.contentView)

**Current status:**
The content of UICollectionViewCell's contentView does not animate alongside contentView frame change. It gets the size immediately without animation.

**Problems already solved:**
The contentView was not animating alongside cell's frame change either, until i did this in UICollectionViewCell subclass:

```swift
override func awakeFromNib() {
    super.awakeFromNib()
    
    //Because contentView won't animate along with cell
    contentView.frame = bounds
    contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
}
```

**Other notes:**
Here is the code involved in cell size animation
```swift
func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    self.selectedIndex = indexPath.row
    
    collectionView.performBatchUpdates({
        collectionView.reloadData() 
    }, completion: nil)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let isSelected = self.selectedIndex == indexPath.row
    let someSize : CGFloat = 90 //doesn't matter
    let sizeK : CGFloat = isSelected ? 0.9 : 0.65
    let size = CGSize(width: someSize * sizeK, height: someSize * sizeK)

    return size
}
```

I get the same results when using `collectionView.setCollectionViewLayout(newLayout, animated: true)`, and there is no animation at all when using `collectionView.collectionViewLayout.invalidateLayout()` instead of `reloadData() inside batchUpdates`.
