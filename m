Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7N6DHV08611
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 02:13:17 -0400
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7N6DAfD014644
	for <linux-lvm@redhat.com>; Tue, 23 Aug 2005 02:13:10 -0400
Received: by rproxy.gmail.com with SMTP id 1so1909rny
	for <linux-lvm@redhat.com>; Mon, 22 Aug 2005 23:13:10 -0700 (PDT)
Message-ID: <5055b5c00508222313a98e23b@mail.gmail.com>
Date: Mon, 22 Aug 2005 23:13:10 -0700
From: Abhishek Gupta <abhishekgupt@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Regarding Recursive Snapshots
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi people,

I am quite interested in implementing a recursive snapshot feature for
LVM2. I wish to know if someone else is already working on it. I am
sure that the original development team is interested in this because
I have seen comments strewn all over the code. Before I start
implementing it, I would request everyone to make some
suggestions/comments as to what will be the best way of doing this.

Looking forward to hearing from all of you.

Thanks

Abhishek Gupta
Graduate Student
Department of Computer Science,
UBC, Vancouver, Canada.
