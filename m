Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2Q3MvO19359
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 22:22:57 -0500
Received: from mail.oum.edu.my ([202.185.23.9])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j2Q3MtVv025378
	for <linux-lvm@redhat.com>; Fri, 25 Mar 2005 22:22:56 -0500
Received: from webmail.oum.edu.my ([192.168.68.16])
	for <linux-lvm@redhat.com>; Sat, 26 Mar 2005 11:20:13 +0800
From: ainuddin@oum.edu.my
Message-ID: <2921.192.168.5.24.1111805770.squirrel@192.168.5.24>
Date: Sat, 26 Mar 2005 10:56:10 +0800 (MYT)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] ia64bit Clustered
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/html; charset="utf-8"
To: linux-lvm@redhat.com


Dear LVM subscribers.<br /><br />I just subscribe to this list. I was just wondering if
any of you can kindly assist me. I have 3 questions but even if you can answer only one
of my question I would be very grateful.<br /><br />We are in the middle of clustering
Oracle server running Itanium 64 bit Redhat Advanced Server 3. From what I know, RHAS 3
has LVM version 1.<br /><br />1.� I was looking into the possibility of setting up an
LVM in the clustered server (even if we are the first organization in the world that
done this). Is there any other organization or anybody that have done this before ?<br
/><br />2.� I read RAC Best Practice using Oracle 10G and it mention about LVM is not
cluster-aware (page 11). What does it mean ?<br /><br />3.� My plan is like this. I
would just leave these partition and folders to it default filesystem, ext3:-<br />/<br
/>swap<br />/boot<br />/usr<br /><br />These partition below would be setup as LVM:-<br
/>/var<br />/var/log<br />/tmp<br />/home<br />/root<br /><br />This is because in /home
and /root, our users usually like to save their backups and did not removed it
afterwards. Usually we got / partition full as a result.<br /><br />----------<br
/>Ainuddin<br />
