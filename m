Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j16KFewq003131
	for <linux-lvm@redhat.com>; Sun, 6 Feb 2005 20:15:40 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Cxsom-00061Q-8k
	for linux-lvm@redhat.com; Sun, 06 Feb 2005 20:15:40 +0000
Date: Sun, 6 Feb 2005 20:15:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Mapping between PEs and Logical Volumes - Remapping
	ofP Es in a Volume Group which is on one PV
Message-ID: <20050206201540.GH14093@agk.surrey.redhat.com>
References: <1107714005.31216.214443428@webmail.messagingengine.com>
	<1107716646.1759.214446453@webmail.messagingengine.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1107716646.1759.214446453@webmail.messagingengine.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Feb 06, 2005 at 11:04:06AM -0800, Ajeet Nankani wrote:
> but this --alloc option is not mentioned in man page!!

It's mentioned on the 'lvm' man page as still under development.
pvmove is the first command to make use of 'anywhere'.

Alasdair
-- 
agk@redhat.com
