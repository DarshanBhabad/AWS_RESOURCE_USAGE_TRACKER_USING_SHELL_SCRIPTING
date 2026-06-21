# AWS Resource Tracker

A shell scripting project to track and monitor AWS resource usage, with support for scheduling via cron.

**Author:** Darshan Bhabad
**Version:** 1.0

---

## What It Does

Tracks the following AWS resources and logs them to `/home/ubuntu/resources.txt`:

- S3 Buckets
- EC2 Instances
- Lambda Functions
- IAM Users

---

## Files

| File | Description |
|------|-------------|
| `Resource_tracker.sh` | Core script that lists all AWS resources |
| `Cronjob_resc_tracker.sh` | Extended version with cronjob setup instructions |

---

## Prerequisites

- AWS CLI installed and configured (`aws configure`)
- `jq` installed for JSON parsing
- An Ubuntu EC2 instance (or any Linux system)

---

## Usage

### Run Manually

```bash
chmod 777 Resource_tracker.sh
./Resource_tracker.sh
```

Output is saved to `/home/ubuntu/resources.txt`.

### Schedule as a Cronjob (Run Daily at 9:00 AM)

```bash
# Open crontab
crontab -e

# Add this entry
0 9 * * * /home/ubuntu/Resource_tracker.sh
```

Verify the job was added:
```bash
crontab -l
```

Check cron logs (Amazon Linux):
```bash
sudo cat /var/log/cron
```

---

## Output Example

```
Listing S3 Buckets...
my-bucket-1
my-bucket-2

Listing EC2 Instances...
"i-0abc123def456"

Listing Lambda Functions...
"my-lambda-function"

Listing IAM Users...
"admin-user"
```
