Message-ID: <3F6FEB47.30404@tupshin.com>
From: Tupshin Harper <tupshin@tupshin.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcreate problem
References: <200309230122.09869.sundiatah1@comcast.net>
In-Reply-To: <200309230122.09869.sundiatah1@comcast.net>
Content-Transfer-Encoding: 7bit
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
Date: Tue Sep 23 01:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Qv6 wrote:

>	
>Hi,
>
>I just created 2 PVs with the following commands:
>
>pvcreate /dev/hda6
>
>pvcreate /dev/hdb
>
>When I ran vgcreate, I got this error:
>
>vgcreate gentis /dev/hda6 /dev/hdb
>
>vgcreate -- no valid physical volumes in command line
>
>Any help to resolve this error will be appreciated.
>
>Qv6
>  
>
You might get this if /dev/hda6 and /dev/hdb are symlinks (for example, 
if you are using devfs).
Do an ls -l on those and see if they actually point to something like 
/dev/ide/host0/bus0/target0/lun0/disc.

If they are symlinks, calling vgcreate with the full, real path to those 
volumes would work. If that's not it, I'm stumped.

-Tupshin
