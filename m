From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm and scsidev
Message-ID: <20040115122342.GA3703@percy.comedia.it>
References: <40064F10.8080509@cineca.it>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <40064F10.8080509@cineca.it>
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
Date: Thu Jan 15 07:25:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 15, 2004 at 09:28:00AM +0100, Tommaso Cecchi wrote:
>What I guess is that devices created by scsidev are not visible under 
>/proc/partitions
>but I'm not sure about that.
this is the right guess, lvm1 only works with device names defined in
proc partitions, you will find this issue discussed multiple times in
this list, mostly concerning devfs issues.

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
