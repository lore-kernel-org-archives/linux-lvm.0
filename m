Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1LK3Mi16855
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 15:03:22 -0500
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@kth.se>
Message-ID: <yw1x65e0nqu6.fsf@ford.guide>
References: <20040221195224.GA25784@gblx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: LVM retirement?
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
Date: Sat Feb 21 15:02:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Dan Foster <dsf@globalcrossing.net> writes:

> I was discussing implementing LVM on upcoming Linux boxes with co-workers;
> one said he was reluctant to consider LVM because he had heard somewhere
> recently that LVM was to be dropped/retired soon, but couldn't remember
> where (or from whom) he'd seen/heard that mention.

He was probably referring to LVM1, which is no longer available in
Linux 2.6 kernels.  It has been replaced by the more flexible
device-mapper, and the LVM2 userland tools.  LVM1 volume groups can
still be used with LVM2.

-- 
M�ns Rullg�rd
mru@kth.se
