Message-ID: <EA753F4887A6ED449866D7F307ABBFDB52499E@mailserver.e-r-solutions.com>
From: ERG@e-r-solutions.com
Subject: RE: [linux-lvm] Error - "device-mapper: request is larger than bl
	ock size b_size"
MIME-Version: 1.0
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
Date: Thu Aug 22 20:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>> device-mapper: request is larger than block size b_size (2048), block
size
>> (512)

>Sorry about this, it's an overly verbose sanity check that I put in
>when we were having problems with xfs writing misaligned blocks.  I've
>knocked it out of the latest bitkeeper repository...
[snip]
>Alternatively just knock out this if statement from dm.c:
>
>        /*
>         * Sanity checks.
>         */
>        if (bh->b_size > block_size)
>                DMERR("request is larger than block size "
>                      "b_size (%d), block size (%d)",
>                      bh->b_size, block_size);
>
>
>If you are using xfs please be aware that you will need to use the new
>journal log format to avoid misalignment problems (search this list
>for previous posts).

If I get the XFS alignment ironed out, will I cease seeing these
device-mapper warnings?

In other words, can I use those warnings as a test of my log alignment
correctness?


Thank you,
Manuel Gomez
