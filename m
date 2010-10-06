Message-ID: <4CACC6B0.2030603@cfl.rr.com>
Date: Wed, 6 Oct 2010 14:57:52 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <87363.97197.qm@web120701.mail.ne1.yahoo.com>	<4CAB46FE.9050309@cfl.rr.com>	<86106.13599.qm@web120714.mail.ne1.yahoo.com>	<Pine.LNX.4.64.1010061255250.12083@bmsred.bmsi.com>
	<87ocb7jk3d.fsf@twilight.int.mornfall.net.>
In-Reply-To: <87ocb7jk3d.fsf@twilight.int.mornfall.net.>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM mirror questions
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
Content-Type: text/plain; charset="us-ascii"
To: Petr Rockai <prockai@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 10/6/2010 1:40 PM, Petr Rockai wrote:
> Yes, (write) performance is a concern. Otherwise, what you describe is
> perfectly valid and achievable with LVM.

It is?  What happens when the log device fails?

>> I don't know how LVM handles issues of PVs that are not permanently dead
>> and come back on line again later.  The md driver uses a generation count in
>> the super block to determine which is newer. (How is that updated without loss
>> of efficiency?)
> 
> LVM has a generation counter as well. It's only updated on metadata
> writes though, so it doesn't cost anything. (Log is not part of metadata
> in this sense.) When you lose a leg (and use dmeventd), the metadata on
> the remaining PVs is updated to say that. The leg is also yanked from
> the mirror. You can add it as a fresh image (with full resync) if it
> ever comes back.

Why a full resync?  With mdadm, it just keeps flagging the dirty chunks
so it only has to copy those when the other disk returns.
