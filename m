From: "Mikael Lirbank" <mikael@lirbank.com>
Message-ID: <008401c25417$791d0080$0a2fa00a@home.lirbank.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: 
Subject: [linux-lvm] RE: LV maximum size
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
Date: Wed Sep  4 08:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

OK, got it 64k PEs times 4MB per PE equals 256GB

So that means if I set PE size to 8MB I double my max size of the LV...
and so on.

But then what is the max PE size? And what are the drawbacks of
increasing it?

Thanks again

/Mikael
