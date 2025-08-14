pragma solidity ^0.8.0;

 /**
  * @title Decentralized Blockchain dApp Notifier
  * @author [Your Name]
  * @notice This contract is a decentralized blockchain dApp notifier
  * that allows users to receive notifications upon specific events
  * occuring on the blockchain
  */

contract DecentralizedNotifier {
    // Mapping of users to their notification preferences
    mapping(address => mapping(bytes32 => bool)) public userNotifications;

    // Mapping of event hashes to their corresponding notification types
    mapping(bytes32 => string) public eventNotifications;

    // Event emitted when a user sets their notification preference
    event NotificationSet(address indexed user, bytes32 indexed eventHash, bool enabled);

    // Event emitted when a notification is triggered
    event NotificationTriggered(address indexed user, bytes32 indexed eventHash, string notificationType);

    /**
     * @dev Sets a user's notification preference for a specific event
     * @param _eventHash The hash of the event to set the notification for
     * @param _enabled Whether to enable or disable notifications for the event
     */
    function setNotification(bytes32 _eventHash, bool _enabled) public {
        userNotifications[msg.sender][_eventHash] = _enabled;
        emit NotificationSet(msg.sender, _eventHash, _enabled);
    }

    /**
     * @dev Triggers a notification for a specific event if the user has enabled it
     * @param _eventHash The hash of the event that triggered the notification
     * @param _notificationType The type of notification to trigger
     */
    function triggerNotification(bytes32 _eventHash, string memory _notificationType) public {
        if (userNotifications[msg.sender][_eventHash]) {
            emit NotificationTriggered(msg.sender, _eventHash, _notificationType);
        }
    }

    /**
     * @dev Sets the notification type for a specific event
     * @param _eventHash The hash of the event to set the notification type for
     * @param _notificationType The type of notification to set
     */
    function setEventNotification(bytes32 _eventHash, string memory _notificationType) public {
        eventNotifications[_eventHash] = _notificationType;
    }
}