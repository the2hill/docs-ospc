---
permalink: mount-a-partition-and-chroot-into-your-primary-file-system-from-rescue-mode
audit_date: '2021-05-19'
title: Mount a partition and chroot into your primary file-system from rescue mode
type: article
created_date: '2019-01-17'
created_by: Rackspace Community
last_modified_date: '2021-05-19'
last_modified_by: Ana Corpus
product: Cloud Servers
product_url: cloud-servers
---

This article shows how to mount a partition and use the `chroot` command to access your
primary file system from [rescue mode](https://docs-ospc.rackspace.com/support/how-to/cloud-servers/rescue-mode/).

### Begin an investigation of a server in rescue mode

Use the following steps to begin an investigation of a server in rescue mode:

1. Determine your main partition by running the following command:

       fdisk -l

   **Note**: Depending on the version of the base image that you have built from, the
   partition is either `sdb1` (Xen&reg; Classic) or `xvdb1` (XenServer&reg;).
   Choose the largest partition with `fdisk -l`. This article assumes you use XenServer.

2. Mount the partition by running the following command, replacing `xvdb1` if necessary:

       mount /dev/xvdb1 /mnt

   When you navigate to the `/mnt` directory, you should see your file system.

   In some cases, you might need to install a new kernel, remove a bad package, or use
   `xvdb1` as the root (`/`) directory.

### Use xvdb1 as the root directory

Use the following steps to set `xvdb1` as the `/` directory:

1. Mount the necessary file system directories by running the following commands:

       mount -t proc none /mnt/proc
       mount --rbind /sys /mnt/sys
       mount --rbind /dev /mnt/dev

2. Set up networking for your session on which you used the `chroot` operation by running
   the following commands:

       ln -s /etc/resolv.conf /mnt/etc/resolv.conf

       chroot /mnt /bin/bash

   The file system is now mounted as the root directory.

Use the Feedback tab to make any comments or ask questions. You can also click **Let's Talk**
to [start the conversation](https://www.rackspace.com/).
