Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4J10eeT021052
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 21:00:41 -0400
Received: from kallisti.us (kallisti.us [67.59.168.233])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4J10dxo031060
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 21:00:39 -0400
From: Ross Vandegrift <ross@kallisti.us>
Date: Fri, 18 May 2007 21:00:33 -0400
Subject: Re: [linux-lvm] difference in space used
Message-ID: <20070519010033.GA12791@kallisti.us>
References: <464E22F3.5040108@perusion.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <464E22F3.5040108@perusion.com>
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
To: Greg <greg@valuemedia.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 18, 2007 at 03:04:35PM -0700, Greg Hanson wrote:
> [root@newbox1 ~]# du /log/
> 16      /log/lost+found
> 23696   /log/httpd
> 23716   /log/
> 
> Any ideas as to what could be going on?

An unlinked file isn't actually deleted until all file handles to it
are closed.  Since this is your log partition, you probably have
broken log rotation script.  I bet its moving the files to a new name,
but the logging process isn't closing and reopening the logfile.

These files that are unlinked but still have open handles to them
continue to consume their usual amount of disk space.  FWIW, I have
seen this issue particularly noticably with MySQL when the query log
is enabled, but that's a wild guess...

-- 
Ross Vandegrift
ross@kallisti.us

"The good Christian should beware of mathematicians, and all those who
make empty prophecies. The danger already exists that the mathematicians
have made a covenant with the devil to darken the spirit and to confine
man in the bonds of Hell."
	--St. Augustine, De Genesi ad Litteram, Book II, xviii, 37
