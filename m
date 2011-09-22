Message-ID: <4E7B08A8.3030409@redhat.com>
Date: Thu, 22 Sep 2011 12:06:32 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-12-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-12-git-send-email-lczerner@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 11/35] fsadm: Add "remove" command
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: linux-lvm@redhat.com

Dne 21.9.2011 18:45, Lukas Czerner napsal(a):
> Remove command allows to remove unused devices from the pool (volume
> group).
> 
> Signed-off-by: Lukas Czerner <lczerner@redhat.com>
> ---
>  scripts/fsadm.sh |   82 ++++++++++++++++++++++++++++++++++++++++-------------
>  1 files changed, 62 insertions(+), 20 deletions(-)
> 
> diff --git a/scripts/fsadm.sh b/scripts/fsadm.sh
> index 6617de0..4a4f625 100755
> --- a/scripts/fsadm.sh
> +++ b/scripts/fsadm.sh
> @@ -823,11 +823,12 @@ list_filesystems() {
>  	IFS=$NL
>  	local c=0
>  	for line in $(LANG=C $LVM lvs -o lv_path,lv_size,segtype --noheadings --separator ' ' --nosuffix --units k 2> /dev/null); do
> -		c=$((c+1))
>  		line=$(echo $line | sed -e 's/^ *\//\//')
>  		volume=$(echo $line | cut -d' ' -f1)
> -		volumes[$c]=$volume
> -		segtype[$c]=$(echo $line | cut -d' ' -f3)
> +		[ "$volume" == "$last_volume" ] && continue
> +		c=$((c+1))
> +		local volumes[$c]=$volume
> +		local segtype[$c]=$(echo $line | cut -d' ' -f3)
>  		detect_fs $volume
>  		detect_mounted
>  		detect_fs_size

Could you please update/cleanup the patch set - so it doesn't rework same code
multiple times over and over ?
(It's a waste of time to review new code, which gets replaced several times
during the whole patch set)

Thanks

Zdenek
