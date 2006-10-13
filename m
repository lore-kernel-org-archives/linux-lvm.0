Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DIbKIp006519
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 19:37:20 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GYRuK-0003Fx-7E
	for linux-lvm@redhat.com; Fri, 13 Oct 2006 19:37:20 +0100
Date: Fri, 13 Oct 2006 19:37:20 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Unable to add new drive to LV
Message-ID: <20061013183720.GJ17654@agk.surrey.redhat.com>
References: <200610130827.42040.pwaldo@waldoware.com>
	<452FB129.7020208@gmx.net> <452FBCAA.4080000@redhat.com>
	<452FD0DC.5030904@waldoware.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <452FD0DC.5030904@waldoware.com>
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

On Fri, Oct 13, 2006 at 01:46:04PM -0400, Paul Waldo wrote:
> I interpret the above to mean that I can concatenate the single drive after 
> the existing stripped array.  

Add -i1 to extend in a single stripe. (man lvextend)

Alasdair
-- 
agk@redhat.com
