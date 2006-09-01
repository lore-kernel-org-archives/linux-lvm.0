Date: Fri, 1 Sep 2006 11:18:18 -0400
From: Matthew Galgoci <mgalgoci@redhat.com>
In-Reply-To: <5F08B160555AC946B5AB743B85FF406D05ABF277@ex2k.bankofamerica.com>
Message-ID: <Pine.LNX.4.64.0609011115380.32322@acis.rdu.redhat.com>
References: <5F08B160555AC946B5AB743B85FF406D05ABF277@ex2k.bankofamerica.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: Cleaning up stale handles in /etc/mtab
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rodrick.r.brown@bofasecurities.com, redhat-sysadmin-list@redhat.com
Cc: linux-lvm@redhat.com

> Date: Fri, 01 Sep 2006 11:13:41 -0400
> From: "Brown, Rodrick R" <rodrick.r.brown@bofasecurities.com>
> Reply-To: redhat-sysadmin-list@redhat.com
> To: redhat-sysadmin-list@redhat.com
> Cc: linux-lvm@redhat.com
> Subject: Cleaning up stale handles in /etc/mtab
>
> Not sure what exactly happened on this server but it looks like the LUNS
> were pulled w/o removing the volumes correctly or something of that
> sort.

If you've got processes in D waiting on those volumes I think you might
be hosed beyond recovery without reboot.

Having said that, you could try bumping up /proc/sys/fs/file-max to something
insanely high and then cat /proc/mounts > /etc/mtab

After that, I could only make wild guesses as to what needs to happen next.

-- 
Matthew Galgoci
IS Production Operations
Red Hat, Inc
919.754.3700 x44155
