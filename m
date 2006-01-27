Date: Fri, 27 Jan 2006 21:33:14 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] error msg: VG vgc1 metadata too large for circular
	buffer
Message-ID: <20060127213314.GF4280@agk.surrey.redhat.com>
References: <43DA841D.3080208@funsoft.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43DA841D.3080208@funsoft.com>
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
To: eheman@funsoft.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jan 27, 2006 at 03:35:41PM -0500, Gary Eheman wrote:
> I can destroy the data. In fact, that is what I would like to do, but 
> softly using lvremove, vgremove, pvremove if possible. But I can't get 
> around the current error.
> 
> Advice,please?  Are there parameters I can give during the creation of 
> the group or volume to avoid this?

As you realised, you need to recreate the PV with a much larger 
metadatasize.

There are no tools yet to manipulate it after it's been created.

If you can throw it away, do that: vgchange -an to deactivate everything
then pvremove -ff to destroy it.

[If you weren't able to do that, there are workarounds involving making
lvm2 stop using that metadata area and using a new larger one somewhere
else instead.]

Alasdair
-- 
agk@redhat.com
