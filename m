Message-ID: <3B95E1D0.6000000@st-peter.stw.uni-erlangen.de>
Date: Wed, 05 Sep 2001 10:26:56 +0200
From: svetljo <galia@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Subject: Re: what i need is a little attention-RE [linux-lvm] SoftRaid and LVM   Jean-Eric Cuendet
References: <B45465FD9C23D21193E90000F8D0F3DF404FF5@mailsrv.linkvest.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

thanks

i think it was 2.4.9 and Alan Cox still doesn't wont it, it's quite a 
long time 2.4.9 being out there
 
 
Jean-Eric Cuendet wrote:

>>and one more question about the min-max
>>i don't speak "C" can you tell me how to do it with pre
>>linux-2.4.9patches wich i wont to aply to linux-2.4.10pre2 
>>and they are giving me problems 
>>with min-max definition
>>
>
>The min/max functions are simple functions that return the min/max of
>two numbers.
>Ex: min(3,4) return 3
>Now, Linus has added a type to those functions in 2.4.8 (I think):
>Ex: min(int, 3, 4) = 3
>Or: min(float, -6.45, 4.5) = -6.45
>
>So, either you change the call from:
>min(a, b) to min(int,a,b)
>Or you add the provided replacement functions:
>#define min(a,b) (((a)<(b))?(a):(b)) 
>#define max(a,b) (((a)>(b))?(a):(b)) 
>At the *beginning* of the file (before anything else).
>
>Note that these are not real functions but just macros. That's why it's
>so simple (just add them and forget).
>
>Bye
>-jec
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
