Date: Thu, 9 Mar 2000 18:49:59 +0100
From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] 12 x UDMA disks -- problems
Message-Id: <20000309184959.A14256@fb0442.mathematik.tu-darmstadt.de>
References: <Pine.LNX.4.10.10003091735500.19333-100000@tie.egs.uct.ac.za>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.10.10003091735500.19333-100000@tie.egs.uct.ac.za>; from hewitson@egs.uct.ac.za on Thu, Mar 09, 2000 at 05:41:15PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Thu, Mar 09, 2000 at 05:41:15PM +0200, Bruce Hewitson wrote:
[...]
> major=`Major ide4 56`
> major=`Major ide5 57`
> 
> For ide6 and ide7, how do I determine the Major numbers?
> 
see <kernelsource>/Documentation/devices.txt

Holger
-- 
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
