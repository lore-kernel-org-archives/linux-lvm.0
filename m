Message-ID: <3DC9E5E1.102D4A9B@ezinc.com>
From: Miwako Nakai <nakai@ezinc.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cache buffer size
References: <OF442EBFE4.3A4EDB03-ON85256C69.005AF60C@pok.ibm.com>
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
Date: Wed Nov  6 22:04:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thank you Mr.Best

Steve Best wrote:
> 
> Miwako Nakai wrote:
> >Thank you, Mr.Mauelshagen
> >
> >JFS can not have fixed block size. But I heard from JFS group in IBM
> >that on 2.5 or later it will be improved. I do not know JFS will have
> >fixed block size or not. They said 'improved'.
> 
> This isn't right, JFS block size is fixed at 4k. Do you only have this
> problem if you snapshot? Could you explain some more about your setup.
> Are all of your LVs JFS?

YES. It happens only when using snapshot. Does snapshot use 1k block
size?

--
nakai@ezinc.com
