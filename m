Message-ID: <3FFD9E2C.2040105@stercomm.com>
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] S.A.M.E methodology
References: <1DCD421BDE8C3C478E9A0A84B75702931165D6@srv-pae-ex01.rge-rs.com.br> <1073584771.14632.20.camel@gecko.indygecko.com>
In-Reply-To: <1073584771.14632.20.camel@gecko.indygecko.com>
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
Date: Thu Jan  8 13:16:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Jord Tanner wrote:
> This technique, also called RAID 1+0, is often used in database
...

While both RAID 0+1 and RAID 10 have good performance
characteristics... RAID 10 is much, much more reliable.
Good RAID 10 solutions generally are HW based RAID.
Though I have used Veritas in the past to do a RAID 10.
Not sure exactly how to perform a RAID 10 in software
with Linux.  A single drive failure in 0+1 invalidates
the entire column.  With RAID 10, there's the possibility
of tolerating multiple drive failures.
