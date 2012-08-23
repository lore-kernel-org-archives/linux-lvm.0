Date: Thu, 23 Aug 2012 22:01:34 +0200
From: Mark van Dijk <lists+linux-lvm@internecto.net>
Message-ID: <20120823220134.20a36b13@internecto.net>
In-Reply-To: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
References: <1345728662-28052-1-git-send-email-mbooth@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] dmsetup: fix sscanf return check
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: mbooth@redhat.com

On Thu, 23 Aug 2012 14:31:02 +0100
Matthew Booth <mbooth@redhat.com> wrote:

> ---
>  tools/dmsetup.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/tools/dmsetup.c b/tools/dmsetup.c
> index 0ac970f..65d17f8 100644
> --- a/tools/dmsetup.c
> +++ b/tools/dmsetup.c
> @@ -228,8 +228,7 @@ static int _parse_line(struct dm_task *dmt, char
> *buffer, const char *file, if (!*ptr || *ptr == '#')
>  		return 1;
>  
> -	if (sscanf(ptr, "%llu %llu %s %n",
> -		   &start, &size, ttype, &n) < 3) {
> +	if (sscanf(ptr, "%llu %llu %s %n", &start, &size, ttype,
> &n) != 4) { err("Invalid format on line %d of table %s", line, file);
>  		return 0;
>  	}

Ah. For non-coders like myself the purpose of this patch seems to be
clouded in mystery...

-- 
Stay in touch,
Mark van Dijk.                  ,------------------------------------
-------------------------------'            Thu Aug 23 20:00 UTC 2012
Today is Setting Orange, the 16th day of Bureaucracy in the YOLD 3178
