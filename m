Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2A1Px819430
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 20:25:59 -0500
Received: from mwinf0804.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2A1Pw07031850
	for <linux-lvm@redhat.com>; Tue, 9 Mar 2004 20:25:59 -0500
Received: from wwinf0803 (wwinf0803 [172.22.139.30])
	by mwinf0804.wanadoo.fr (SMTP Server) with ESMTP id 624C41800075
	for <linux-lvm@redhat.com>; Wed, 10 Mar 2004 02:25:53 +0100 (CET)
Message-ID: <399262.1078881953394.JavaMail.www@wwinf0803>
From: "dld.pascal.garcia" <dld.pascal.garcia@wanadoo.fr>
Subject: Re: [linux-lvm] Help : vg not accessible (with pvdata result)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Tue Mar  9 20:24:00 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello, 
remind of the probem : by some manipulation quite uncontrolled, I ended with a pv of a 
vg completly unconsistant. 
 
I finally modified the vgda to have a vg consistant enough to restart. And I activate the 
vg, and my data is now available. Thanks to Heinz. 
 
But I found and interresting bug on vgimport that mixed the data of an active vg on the 
system and the vg I imported. The condition to have this problem is to have the name of 
an active vg identical to the name of the vg to be imported.   
 
As soon as I know the end I inform you. 
 
Regards 
 
 
Pascal Garcia 
 
 
 
