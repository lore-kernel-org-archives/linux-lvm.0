Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1B8g5i20896
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 03:42:05 -0500
Received: from ariel.yandex.ru (ariel.yandex.ru [213.180.200.32])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1B8g4b08300
	for <linux-lvm@redhat.com>; Wed, 11 Feb 2004 03:42:04 -0500
From: "Alexander Konovalenko" <a-konovalenko@yandex.ru>
Message-Id: <4029EACB.000002.21232@ariel.yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Secure deletion of data in LVM partitions
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 11 03:41:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I would like to make recovery of the data on LVM partitions (volumes) more difficult by physically overwriting them with random data several times.  (For background information, please see the ever-linked paper by Peter Gutmann at http://www.cs.auckland.ac.nz/~pgut001/pubs/secure_del.html.  One utitility that provides mentioned functionality is wipe, see http://wipe.sf.net.)

So my question is how does LVM store its meta-information about the logical and physical volumes?  Is there some meta-info stored in every block?  What parts of data are not physically overwritten when writing to a logical volume?  This is important because in order to delete data more securely one has to overwrite physical tracks of the disk where the data were previously stored.

  -- Alexander
