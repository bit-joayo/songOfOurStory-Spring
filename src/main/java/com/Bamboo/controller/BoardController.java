package com.Bamboo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.text.DateFormat;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.Bamboo.service.PostService;
import com.Bamboo.service.SongService;
import com.Bamboo.vo.CommentVo;
import com.Bamboo.vo.PostVo;
import com.Bamboo.vo.SongVo;
import com.Bamboo.vo.UserVo;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import oracle.net.jdbc.TNSAddress.Address;

@Controller
public class BoardController {
	@Autowired
	private PostService postServiceImpl;
	@Autowired
	private SongService songServiceImpl;

	
	// MARK : GET METHOD
	@RequestMapping(value = "/", method = RequestMethod.GET)
	   public String getHome() {
		
	      return "/board/index";
	   }
	
	
	
	// MARK: write page get
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	   public String writeGet(Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
	      UserVo userVo = (UserVo) session.getAttribute("authUser");
	      model.addAttribute("userVo", userVo);
	      
	      if(userVo != null) {
	         return "/board/write";
	      } else {
	         response.setContentType("text/html; charset=UTF-8");
	         PrintWriter out = response.getWriter();
	         out.println("<script>alert('로그인 후 이용해 주세요');</script>");
	         out.println("<script>document.location.href='/Bamboo/user/login';</script>");
	         out.flush();
	         
	         return "/user/login";
//	         return "redirect:/user/login";
	      }
	   }

	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public String modifyGet(Model model, @RequestParam("postNo") Long postNo,
			HttpSession session) {
		
		PostVo postVo = postServiceImpl.getPostByPostNo(postNo);
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		
		model.addAttribute("postVo", postVo);
		model.addAttribute("userVo", userVo);

		return "/board/modify";
	}
	/*
	// MARK: list page get, post
		@RequestMapping(value ="/list",method = RequestMethod.GET)
		public String listGet(Model model) {
			
			String strUrl = "http://127.0.0.1:5000/allSelect";
			String strMethod = "post";
			BufferedReader br = null;

			try {
				URL url = new URL(strUrl);//URL Open
				
				HttpURLConnection con = (HttpURLConnection) url.openConnection(); //URL connect
				con.setDoOutput(true);//POST데이터를 OutputStream으로 넘겨준다
				con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
				con.setRequestMethod(strMethod.toUpperCase());
				con.setConnectTimeout(7000);
				
				PrintStream ps = new PrintStream(con.getOutputStream());
				StringBuilder sb = new StringBuilder();
				
				if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
					String line;
					while((line = br.readLine())!= null) {
						sb.append(line).append("\n");
					}
					br.close();
				}else {
					System.out.println(con.getResponseMessage());
				}
		
				ps.close();
				con.disconnect();
				
				Gson gson = new GsonBuilder().setDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz").create();
				String json = sb.toString();
				
				PostVo[] vo = gson.fromJson(json, PostVo[].class);
				List<PostVo> postVoList = Arrays.asList(vo);
				
				model.addAttribute("postVoList", postVoList);
				
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (br != null) {
					try {
						br.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
			return "/board/list";
		}
	*/
	@RequestMapping(value ="/list",method = RequestMethod.GET)
	public String listGet2(Model model) {
		
		String strUrl = "http://127.0.0.1:5000/allSelect";
		String strMethod = "post";
		BufferedReader br = null;

		try {
			URL url = new URL(strUrl);//URL Open
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection(); //URL connect
			con.setDoOutput(true);//POST데이터를 OutputStream으로 넘겨준다
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			con.setConnectTimeout(7000);
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			StringBuilder sb = new StringBuilder();
			
			if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String line;
				while((line = br.readLine())!= null) {
					sb.append(line).append("\n");
				}
				br.close();
			}else {
				System.out.println(con.getResponseMessage());
			}
	
			ps.close();
			con.disconnect();
			
			Gson gson = new GsonBuilder().setDateFormat("EEE, dd MMM yyyy HH:mm:ss zzz").create();
			String json = sb.toString();
			
			PostVo[] vo = gson.fromJson(json, PostVo[].class);
			List<PostVo> postVoList = Arrays.asList(vo);
			
			model.addAttribute("postVoList", postVoList);
			
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		return "/board/list";
	}
	
	
	// MARK : POST METHOD
	
	@RequestMapping(value = "/updateObject", method = RequestMethod.POST)
	public void updateObject(@RequestBody PostVo postVo) {
		
		String strUrl = "http://127.0.0.1:5000/updatePost";
		String strMethod = "post";
		String title = postVo.getTitle();
		String postContent = postVo.getPostContent();
		String userId = postVo.getUserId();
		String postNo =  Long.toString(postVo.getPostNo());
		String topic = postVo.getTopic();
		BufferedReader in = null;

		try {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("postContent", postContent);
			jsonObject.addProperty("title", title);
			jsonObject.addProperty("userId", userId);
			jsonObject.addProperty("postNo", postNo);
			jsonObject.addProperty("topic", topic);

			JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());
			URL url = new URL(strUrl);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			ps.print(jsonObject);
			
			ps.close();
			con.disconnect();

			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			
			gsonObject = (JsonObject) jsonParser.parse(in);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

	}
	
	@ResponseBody
	@RequestMapping(value = "/requestObject", method = RequestMethod.POST)
	public void simpleWithObject(@RequestBody PostVo postVo) {
	
		String strUrl = "http://127.0.0.1:5000/writePost";
		String strMethod = "post";

		String title = postVo.getTitle();
		String postContent = postVo.getPostContent();
		String userId = postVo.getUserId();
		String topic = postVo.getTopic();
		
		BufferedReader in = null;

		try {
			
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("postContent", postContent);
			jsonObject.addProperty("title", title);
			jsonObject.addProperty("userId", userId);
			jsonObject.addProperty("topic", topic);
			
			JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());
			URL url = new URL(strUrl);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			ps.print(jsonObject);
			
			ps.close();
			con.disconnect();
			
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			gsonObject = (JsonObject) jsonParser.parse(in);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	   public String deletePost(@RequestBody Long postNo) {
	      
	      String strUrl = "http://127.0.0.1:5000/deletePost";
	      String strMethod = "post";
	      String delete_postNo = Long.toString(postNo);
	      BufferedReader in = null;
	      
	      try {
	         JsonParser jsonParser = new JsonParser();
	         JsonObject jsonObject = new JsonObject();
	         
	         jsonObject.addProperty("delete_postNo", delete_postNo);
	         JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());

	         URL url = new URL(strUrl);
	         
	         HttpURLConnection con = (HttpURLConnection) url.openConnection();
	         con.setDoOutput(true);
	         con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
	         con.setRequestMethod(strMethod.toUpperCase());
	        
	         PrintStream ps = new PrintStream(con.getOutputStream());
	         ps.print(jsonObject);
	         
	         ps.close();
	         con.disconnect();

	         in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
	         gsonObject = (JsonObject) jsonParser.parse(in);
	      } catch (MalformedURLException e) {
	         e.printStackTrace();
	      } catch (IOException e) {
	         e.printStackTrace();
	      } finally {
	         if (in != null) {
	            try {
	               in.close();
	            } catch (IOException e) {
	               e.printStackTrace();
	            }
	         }
	      }
	      return "/board/list";
	   }

	@ResponseBody
	@RequestMapping(value = "/writeComment", method = RequestMethod.POST)
	public void writeComment(@RequestBody CommentVo commentVo) {
		
		String strUrl = "http://127.0.0.1:5000/writeComment";
		String strMethod = "post";
		String content = commentVo.getContent();
		Long postNo = commentVo.getPostNo();
		String userId = commentVo.getUserId();
		BufferedReader in = null;

		try {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("content", content);
			jsonObject.addProperty("postNo", postNo);
			jsonObject.addProperty("userId", userId);
			
			JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());
			URL url = new URL(strUrl);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			ps.print(jsonObject);
			
			ps.close();
			con.disconnect();
			
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			gsonObject = (JsonObject) jsonParser.parse(in);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	//댓글 삭제
	@RequestMapping(value = "/deleteComment", method = RequestMethod.POST)
	public void deleteComment(@RequestBody Long commentNo) {
		
		String strUrl = "http://127.0.0.1:5000/deleteComment";
		String strMethod = "post";
		Long delete_commentNo = commentNo;
		BufferedReader in = null;
		System.out.println(delete_commentNo);
		
		try {
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("delete_commentNo", delete_commentNo);
			
			
			JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());
			URL url = new URL(strUrl);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			ps.print(jsonObject);
			
			ps.close();
			con.disconnect();
			
			in = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			gsonObject = (JsonObject) jsonParser.parse(in);

		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// MARK: view page get, post
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String viewGet(@RequestParam Long postNo, Model model, HttpSession session) {
		
		String strUrl = "http://127.0.0.1:5000/postView";
		String strMethod = "post";
		BufferedReader br = null;
		
		String post_No =  Long.toString(postNo);
		
		UserVo userVo = (UserVo) session.getAttribute("authUser");
		model.addAttribute("postNo", postNo);
		model.addAttribute("userVo", userVo);

		try {
			
			JsonParser jsonParser = new JsonParser();
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("postNo", post_No);
			JsonObject gsonObject = (JsonObject) jsonParser.parse(jsonObject.toString());
			URL url = new URL(strUrl);
			
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setDoOutput(true);
			con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			con.setRequestMethod(strMethod.toUpperCase());
			
			PrintStream ps = new PrintStream(con.getOutputStream());
			ps.print(jsonObject);
			
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));		
			StringBuilder sb = new StringBuilder();

			if(con.getResponseCode() == HttpURLConnection.HTTP_OK) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
				String line;
				while((line = br.readLine())!= null) {
					sb.append(line).append("\n");
				}
				br.close();
			} else {
				System.out.println(con.getResponseMessage());
			}
			ps.close();
			con.disconnect();
			
			Gson gson = new Gson();
			
			String json = sb.toString();

			JsonParser jsonParser2 = new JsonParser();
			JsonObject jsonObject2 = (JsonObject) jsonParser2.parse(json);
			
			JsonArray songArray = (JsonArray) jsonObject2.get("song");
			SongVo[] songList = gson.fromJson(songArray, SongVo[].class);			
			model.addAttribute("songList", songList);

			
			try {
			JsonArray commentArray = (JsonArray) jsonObject2.get("comment");
			CommentVo[] commentList = gson.fromJson(commentArray, CommentVo[].class);
			 model.addAttribute("commentList", commentList);
			 model.addAttribute("commentListSize", commentList.length);
			 
			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		
		PostVo postVo = postServiceImpl.getPostByPostNo(postNo);
		model.addAttribute("postVo", postVo);
		
		return "/board/view";
	}

}