From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
Message-Id: <20020111103718.GA1274@tykepenguin.com>
References: <22543.1010745017@joergli.cocolab.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <22543.1010745017@joergli.cocolab.de>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jan 11 04:38:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jan 11, 2002 at 11:30:17AM +0100, J?rgen Vollmer wrote:
> 
> Hi everybody,
> 
> I use kernel-source-2.4.16.SuSE-24.i386.rpm together with reiserfs and
> made a snapshot which I then tar'ed.
> Writing the tape seems to be ok. After that I did:
> 
> 	tar --directory=/ --file=/dev/tape --compare
> 
> and got the message (while working i.e. modifying the  original filesystem)
> 
> Message from syslogd@joergli at Fri Jan 11 10:57:19 2002 ...
> joergli kernel: zam-7001: io error in reiserfs_find_entry
> 


> 
> So it seems that the snapshot is full. Is that correct, or do I have a serious
> problem? Note: I'm doing my backups, so a dead backup is not a very good
> one :-)

Yes, your snapshot is full. When this happens LVM fails all I/O to the snapshot.
Unfortunatetly reiserfs doesn't not currently cope very well with I/O errors on
a device hence the message you saw.

You will need to allocate more space to the snapshot LV to get around this.

It's not a serious problem but if you are bothered by the oops I posted a
patch to workaround to the problem here:

http://lists.sistina.com/pipermail/linux-lvm/2001-November/009913.html

It's not great and it doesn't stop the full snapshot being unusable, but it does
stop the oopses.

patrick
