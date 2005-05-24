Date: Tue, 24 May 2005 18:41:11 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] "pvchange --uuid" failed when PV is in use
Message-ID: <20050524174111.GG15809@agk.surrey.redhat.com>
References: <42931ECB.4000806@vx.cnt.dnes.jp.nec.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <42931ECB.4000806@vx.cnt.dnes.jp.nec.com>
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
To: Shinn'ya Hoshino <s-hoshino@vx.cnt.dnes.jp.nec.com>
Cc: linux-lvm@redhat.com

On Tue, May 24, 2005 at 09:32:11PM +0900, Shinn'ya Hoshino wrote:
> I tried to "pvchange --uuid /dev/sdc1" to change of PV UUID.
> But FAILED to change PV UUID on PV metadata, only changed on VG
> metadata. I'm trying to correct source code, please help.
 
I'd hoped to extend vg_write to handle this, but it got too
complicated and I didn't complete it.

I've checked an alternative fix into CVS.
  (Treats it like vgreduce + pvchange -u + vgcfgrestore then
   optimises most of the intermediate steps away)

Alasdair
-- 
agk@redhat.com
