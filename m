From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgcreate problem
Message-ID: <20030923064024.GA28343@percy.comedia.it>
References: <200309230122.09869.sundiatah1@comcast.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200309230122.09869.sundiatah1@comcast.net>
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
Date: Tue Sep 23 01:41:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Qv6 <sundiatah1@comcast.net>
Cc: linux-lvm@sistina.com

On Tue, Sep 23, 2003 at 01:22:09AM -0400, Qv6 wrote:
>vgcreate gentis /dev/hda6 /dev/hdb
>
>vgcreate -- no valid physical volumes in command line
>
>Any help to resolve this error will be appreciated.
you are using lvm 1 with a kernel compiled with devfs
you have to use the long devfs names, check /proc/partitions

regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
