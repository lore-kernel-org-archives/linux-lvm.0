From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Broken compile scripts in LVM
Message-ID: <20021009125221.A23965@sistina.com>
References: <3DA1C82F.5080406@mvista.com>
Mime-Version: 1.0
In-Reply-To: <3DA1C82F.5080406@mvista.com>; from sdake@mvista.com on Mon, Oct 07, 2002 at 10:45:19AM -0700
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
Date: Wed Oct  9 05:54:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Steven,

I have changed that in CVS (Branch: LVM_BRANCH_1-0) a couple of days ago
and announced that on lvm-devel (the list for patches and development
discussions). Jeremy A. Puhlman pointed it out on October 4th already.


On Mon, Oct 07, 2002 at 10:45:19AM -0700, Steven Dake wrote:
> Folks,
> 
> Some of the scripts use echo "string" > /dev/stderr when instead they 
> should be using echo "string" >&2.  I have attached a patch that fixes 
> this problem.  The result is that in automated builds, the stdout gets 
> stomped if you use the first technique (resulting in loss of logging data).
> 
> Thanks.
> 
> -steve

> diff -u3 lvm-1.0.5/scripts/iopver lvm-1.0.5-fixed/scripts/iopver
> --- lvm-1.0.5/scripts/iopver	Tue Jan 22 06:54:13 2002
> +++ lvm-1.0.5-fixed/scripts/iopver	Thu Oct  3 19:46:40 2002
> @@ -48,21 +48,19 @@
>  	sed -e 's/.*LVM_LIB_IOP_VERSION[[:space:]]*\([[:digit:]]*\).*/\1/'`;
>  
>  if [ -z "$ver1" ]; then
> -	echo "Error: iopver can't determine the IOP version from $file1" > \
<SNIP>
> -	echo "$new not found" > /dev/stderr
> +	echo "$new not found" >&2
>  	exit 2;
>  fi
>  


-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
