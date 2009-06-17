Date: Wed, 17 Jun 2009 11:48:45 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20090617154845.GB638@redhat.com>
References: <11905247.42271245248829110.JavaMail.servlet@kundenserver>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <11905247.42271245248829110.JavaMail.servlet@kundenserver>
Subject: [linux-lvm] Re: Exposing the same VG from two different disks
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
To: liam@landv.org.uk
Cc: linux-lvm@redhat.com

On Wed, Jun 17 2009 at 10:27am -0400,
liam@landv.org.uk <liam@landv.org.uk> wrote:

> I've had a closer look at the vgimportclone script and I think the fix for the
>  lost filter is very straight forward. The errors are coming out of the final
>  vgscan and it seems to be caused by the LVM_SYSTEM_DIR variable being set to an 
> empty string rather than being unset. So I made the following change and it seemed 
> to fix the errors...
> 
> 327,333c327
> <
> < if [[ -z ${ORIG_LVM_SYS_DIR} ]]
> < then
> <       unset LVM_SYSTEM_DIR
> < else
> <       LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
> < fi
> ---
> > LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
> 
> I'm not sure if this change causes any issues but I'd be suprised.

Liam,

Looks good, I've committed your fix along with various other fixes to
vgimportclone.

Thanks,
Mike
