From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] determing lvm support
Message-ID: <20031220133541.GF24434@percy.comedia.it>
References: <1071881237.1464.14.camel@rich> <20031220123023.H21022@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031220123023.H21022@uk.sistina.com>
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
Date: Sat Dec 20 07:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Dec 20, 2003 at 12:30:23PM +0000, Alasdair G Kergon wrote:
>On Fri, Dec 19, 2003 at 04:47:18PM -0800, Rich Turner wrote:
>> lvm2:
>> look for "vgcreate" command and
>Better to check for the new 'lvm' base command: other commands are
>links to it: check that running 'lvm version' produces complete output.
>That will also confirm that device-mapper is available in the live
>kernel and that /dev/mapper/control is set up correctly.
>(See device-mapper/scripts/devmap_mknod.sh)
>
Besides that is there any way to reliably check if dm is loaded from a
c program, besides calling dm_task_run(), which is noisy if the driver
is not loaded? I don't want the user to see an error if she's not
running device-mapper.
it the moment i try to open dm_dir()/control, is that ok?

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
