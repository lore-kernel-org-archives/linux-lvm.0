From: Daniel Savard <dsavard@cids.ca>
Content-Transfer-Encoding: 7bit
Message-Id: <1014834685.13642.19.camel@dirac.cids.ca>
MIME-Version: 1.0
Subject: [linux-lvm] Re: lvm 1.0.3, kernel 2.4.17 and the libs...
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
Date: Wed Feb 27 12:31:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I used the following as suggested by Heinz:

pvcreate -ff /dev/sda7

It worked, I was able to recover most of my LVs, but three. However, of
these two were not important at all and I have a backup for the other
one.

BTW, I find out why I ran into an error about a missing definition. As
Heinz suggested I was actually executing a older copy of the utilities
which were copied somewhere else in case of emergency and were before
the newest ones in the path.


Thanks to all for your help,

-- 

=======================================
Daniel Savard

Internet: dsavard@cids.ca
=======================================
