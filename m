From: Luca Lavorante <luca@dedalus.com.br>
Subject: Re: [linux-lvm] question about LVM kernel module - mirroring
Message-id: <3DA6FA68.3020706@dedalus.com.br>
MIME-version: 1.0
Content-type: MULTIPART/ALTERNATIVE;
 BOUNDARY="Boundary_(ID_fnK1bq9AzFcBfEzsr+Sd/g)"
References: <3DA6B710.6060304@dedalus.com.br>
 <20021011114841.GA2613@fib011235813.fsnet.co.uk>
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
Date: Fri Oct 11 11:20:09 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--Boundary_(ID_fnK1bq9AzFcBfEzsr+Sd/g)
Content-type: text/plain; format=flowed; charset=us-ascii
Content-transfer-encoding: 7BIT

Joe, Thanks for your reply.

      Luca

Joe Thornber wrote:

>On Fri, Oct 11, 2002 at 08:33:36AM -0300, Luca Lavorante wrote:
>  
>
>>Hi everybody, I am new to the list and hope you will excuse my (perhaps) 
>>silly questions.
>>
>>1) I have seen in the LVM documentation that the program is divided into:
>>
>>  - A kernel module
>>  - a set o binaries (commands etc.)
>>
>>I?d like to know whether it is possible to use LVM WITHOUT a kernel 
>>module.
>>    
>>
>
>No.
>
>  
>
>>2) How can I perform mirroring using LVM? I know the kernel can do that 
>>on local disks. Is it possible for the kernel of  two clustered machines 
>>to mirror two disks on an external storage?
>>    
>>
>
>LVM doesn't support mirroring ATM.  Try the software raid driver (md).
>
>- Joe
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>


--Boundary_(ID_fnK1bq9AzFcBfEzsr+Sd/g)
Content-type: text/html; charset=us-ascii
Content-transfer-encoding: 7BIT

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
  <title></title>
</head>
<body>
Joe, Thanks for your reply.<br>
<br>
&nbsp; &nbsp; &nbsp; Luca<br>
<br>
Joe Thornber wrote:<br>
<blockquote type="cite"
 cite="mid20021011114841.GA2613@fib011235813.fsnet.co.uk">
  <pre wrap="">On Fri, Oct 11, 2002 at 08:33:36AM -0300, Luca Lavorante wrote:
  </pre>
  <blockquote type="cite">
    <pre wrap="">Hi everybody, I am new to the list and hope you will excuse my (perhaps) 
silly questions.

1) I have seen in the LVM documentation that the program is divided into:

  - A kernel module
  - a set o binaries (commands etc.)

I?d like to know whether it is possible to use LVM WITHOUT a kernel 
module.
    </pre>
  </blockquote>
  <pre wrap=""><!---->
No.

  </pre>
  <blockquote type="cite">
    <pre wrap="">2) How can I perform mirroring using LVM? I know the kernel can do that 
on local disks. Is it possible for the kernel of  two clustered machines 
to mirror two disks on an external storage?
    </pre>
  </blockquote>
  <pre wrap=""><!---->
LVM doesn't support mirroring ATM.  Try the software raid driver (md).

- Joe

_______________________________________________
linux-lvm mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-lvm@sistina.com">linux-lvm@sistina.com</a>
<a class="moz-txt-link-freetext" href="http://lists.sistina.com/mailman/listinfo/linux-lvm">http://lists.sistina.com/mailman/listinfo/linux-lvm</a>
read the LVM HOW-TO at <a class="moz-txt-link-freetext" href="http://tldp.org/HOWTO/LVM-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>

  </pre>
</blockquote>
<br>
</body>
</html>

--Boundary_(ID_fnK1bq9AzFcBfEzsr+Sd/g)--
