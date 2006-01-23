Date: Mon, 23 Jan 2006 13:56:13 +0000
From: "Karl O. Pinc" <kop@meme.com>
Subject: Re: [linux-lvm] Difference in LVM and LVM2 and their strength/weakness
References: <E8AFFEFDBE97C94E9297963F0527A07B07AC77@pmi00exf00.us.packetmotion.com>
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B07AC77@pmi00exf00.us.packetmotion.com>
	(from achen@packetmotion.com on Sun Jan 22 20:16:33 2006)
Message-Id: <1138024573l.3950l.2l@mofo>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: mauelshagen@redhat.com


On 01/22/2006 08:16:33 PM, Alex Chen wrote:
> Heinz, thanks for the information/
> 
> The main intention of our interest of LIME to use it for snapshots.
> I am told that it is a very quick way to make backups.  Is that true?

(LIME?)

To be pedantic, LVM is absolutely not a backup.  You can use it to make
backups from a known state of the system while the system continues to
be updated.  Note that unless you've a way to force your appilcations,
databases, etc. into a known/internally consistent state at the moment
the sanapshot is created this quality is of questionable merit. YMMV.

If you trash the filesystem by crashing the disk, etc., your lvm
snapshot will be trashed too.  Hence, not a backup.

See, for example, rsync with --link-dest for a way to make
backups from your snapshot that retain snapshot-like
disk utilization properties.

Karl <kop@meme.com>
Free Software:  "You don't pay back, you pay forward."
                  -- Robert A. Heinlein
