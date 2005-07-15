Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6FK2FV27751
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:02:15 -0400
Received: from prix.pricom.com.au (80-166.dsl.connexus.net.au [203.222.80.166])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j6FK2Anu032032
	for <linux-lvm@redhat.com>; Fri, 15 Jul 2005 16:02:13 -0400
Date: Fri, 15 Jul 2005 20:01:50 +0000
From: Philip Rhoades <phil@pricom.com.au>
Message-Id: <1121457710l.8253l.0l@prix.pricom.com.au>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvm and reducing vols/ext3
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: linux-lvm@redhat.com

People,

I have looked around at the docs and googled and it seems if I want to  
reduce a root vol/partition I have to:

- boot on an emergency CD

- resize the root ext3 partition

- reduce the lv

Isn't this process just making the exercise more complicated than it  
would have been if I didn't have LVs?

Thanks,

Phil.
-- 
Philip Rhoades

Pricom Pty Limited  (ACN 003 252 275  ABN 91 003 252 275)
GPO Box 3411
Sydney NSW	2001
Australia
Mobile:  +61:(0)411-185-652
Fax:     +61:(0)2-8221-9599
E-mail:  phil@pricom.com.au
