From: "Mark Peloquin" <markpeloquin@hotmail.com>
Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
Mime-Version: 1.0
Message-ID: <F707qH5C5vCczD8GIOl000084ec@hotmail.com>
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
Date: Fri Jul  5 00:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format=flowed; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-kernel@vger.kernel.org
Cc: joe@fib011235813.fsnet.co.uk, linux-lvm@sistina.com

On 2002-07-02 14:17:02, Joe wrote:

>This is a horrible hack to get around the fact that ext3 uses the
>b_private field for its own purposes after the buffer_head has been
>handed to the block layer (it doesn't just use b_private when in the
>b_end_io function).  Is this acceptable behaviour ?  Other > filesystems
>do not have similar problems as far as I know.

Under what conditions does ext3 exhibit this behaviour? In EVMS, we have=20
been stacking the b_private field (for many months), and have not seen any =

problems or have had any problems reported with ext3.

Mark



_________________________________________________________________
Join the world=EF=BF=BDs largest e-mail service with MSN Hotmail.=20
http://www.hotmail.com
