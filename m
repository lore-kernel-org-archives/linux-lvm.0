Date: Tue, 24 May 2011 09:14:52 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110524131451.GB27519@redhat.com>
References: <1306228823.2195.9.camel@franck-VPCCW2S1E>
	<1306230666.2195.10.camel@franck-VPCCW2S1E>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1306230666.2195.10.camel@franck-VPCCW2S1E>
Subject: Re: [linux-lvm] Trim support on stripped volumes ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Franck Routier <alci@mecadu.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, May 24 2011 at  5:51am -0400,
Franck Routier (personnel) <alci@mecadu.org> wrote:

> I found this commit
> http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=commitdiff;h=7b76ec11fec40203836b488496d2df082d5b2022
> that suggests it could work, but I'm not sure at all...

Yes, that is the commit that added discard support to the stripe target,
it works.

> Le mardi 24 mai 2011 � 11:20 +0200, Franck Routier (personnel) a �crit :
> > Hi,
> > 
> > I have set-up of server with 4 SSDs (OCZ Vertex 2) stripped using LVM.
> > Logical volume has been created using the -i 4 option (iostat confirms
> > that the 4 disks work in parallel when I write a file).
> > 
> > Ext4 fs is used on the volume, mounted with -discard option.

When using -o discard, ext4 will log a warning if a discard failed (and
will disable discards).

So ext4 is a great indicator for whether discards are working on your
striped LV volume.

Mike
