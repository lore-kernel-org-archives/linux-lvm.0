Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDGOF118044
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 11:24:15 -0500
Received: from cichlid.com (dsl3-63-249-91-140.cruzio.com [63.249.91.140])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBDGO9wS018726
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 11:24:09 -0500
Received: from cichlid.com (cichlid.com [127.0.0.1])
	by cichlid.com (8.13.1/8.12.5) with ESMTP id jBDGO571009988
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 08:24:05 -0800
Date: Tue, 13 Dec 2005 08:24:05 -0800
From: Andrew Burgess <aab@cichlid.com>
Message-Id: <200512131624.jBDGO5ui009897@cichlid.com>
Subject: [linux-lvm] Re: If one disk fails i loose everything?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

>Good discussion....the need to protect data under various contingencies 
>is why I use raid5 sets as the PVs.  You can lose up to two and keep 
>your data, hot add, have spares, etc.

You mean raid6
