Subject: Re: [linux-lvm] updated lvm2create_initrd script
From: Jeff Layton <jtlayton@poochiereds.net>
In-Reply-To: <1084643736.3043.17.camel@localhost>
References: <1084643736.3043.17.camel@localhost>
Content-Transfer-Encoding: 7bit
Message-Id: <1084648301.3043.34.camel@localhost>
Mime-Version: 1.0
Date: Sat, 15 May 2004 15:12:03 -0400
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alasdair G Kergon <agk@redhat.com>, Miguel =?ISO-8859-1?Q?Cabe=E7a?= <cabeca@ist.utl.pt>

Got a bug report a little while ago from someone using this script on a
RedHat machine. It looks like the MAKEDEV scripts on Debian and RedHat
take different options. Anyone have suggestions on how best to handle
this? I suppose we could do a case statement for each distrib or
something, but then I'll need something to key off of to decide what
invocation to use.

Thanks,
-- 
Jeff Layton <jtlayton@poochiereds.net>
